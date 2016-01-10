<?php
require_once dirname(__FILE__) . '/common/objectbase.php';
class asset extends objectbase {
  public function Save() {
    $logger = new Logger();
    $retval = array();
		$retval['error'] = '';
    $logger->Write();
		if ( 0 < $_FILES['file']['error'] ) {
      $retval['error'] = $_FILES['file']['error'];
      $logger->AppendLine($_FILES['file']['error']);
    }
    else {
      $uploadfilename = $_FILES['file']['name'];
      $logger->AppendLine($uploadfilename);
      $uniqueappend = '';
      $counter = 0;
      $logger->AppendLine($counter);
      while (sizeof(glob('../../../images/' . pathinfo($uploadfilename)['filename'] . $uniqueappend . '.' . pathinfo($uploadfilename)['extension'])) > 0) {
        $counter += 1;
        $uniqueappend = '-' . $counter;
      }
      $logger->AppendLine($uploadfilename);
      $uploadfilename = pathinfo($uploadfilename)['filename'] . $uniqueappend . '.' . pathinfo($uploadfilename)['extension'];
      move_uploaded_file($_FILES['file']['tmp_name'], '../../../images/' . $uploadfilename);
      $this->name = $uploadfilename;
      $logger->AppendLine($uploadfilename);
      objectbase::Save();
    }
  }
}
?>
