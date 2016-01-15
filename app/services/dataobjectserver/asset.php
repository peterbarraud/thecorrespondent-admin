<?php
require_once dirname(__FILE__) . '/common/objectbase.php';
class asset extends objectbase {
  public function Save() {
    $retval = array();
		$retval['error'] = '';
		if ( 0 < $_FILES['file']['error'] ) {
      $retval['error'] = $_FILES['file']['error'];
    }
    else {
      $uploadfilename = $_FILES['file']['name'];
      $uniqueappend = '';
      $counter = 0;
      while (sizeof(glob('../../../images/' . pathinfo($uploadfilename)['filename'] . $uniqueappend . '.' . pathinfo($uploadfilename)['extension'])) > 0) {
        $counter += 1;
        $uniqueappend = '-' . $counter;
      }
      $uploadfilename = pathinfo($uploadfilename)['filename'] . $uniqueappend . '.' . pathinfo($uploadfilename)['extension'];
      move_uploaded_file($_FILES['file']['tmp_name'], '../../../images/' . $uploadfilename);
      $this->name = $uploadfilename;
      objectbase::Save();
    }
  }
}
?>
