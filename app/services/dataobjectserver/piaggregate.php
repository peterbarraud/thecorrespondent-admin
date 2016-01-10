<?php
require_once dirname(__FILE__) . '/common/objectbase.php';
class piaggregate extends objectbase {
  public function Save(){
    require_once 'dataobjectserver/application.php';
		$application = Application::getinstance();

    // piaggregate -> aggregatecolumn -> aggregateitem -> tag
    // first drill down to the aggregateitem
    for ($i=0;$i<sizeof($this->aggregatecolumn);$i++){
      $aggregatecolumnjson = $this->aggregatecolumn[$i];
      //cast the json object to a well formed php object based on the data object model
      $aggregatecolumn = $application->GetObjectForJSON($aggregatecolumnjson,'aggregatecolumn');
      for ($j=0;$j<sizeof($aggregatecolumn->aggregateitem);$j++){
        $aggregateitemjson = $aggregatecolumn->aggregateitem[$j];
        $aggregateitem = $application->GetObjectForJSON($aggregateitemjson,'aggregateitem');
        $aggregateitem->aggregateitemtype[0] = $application->GetObjectForJSON($aggregateitem->aggregateitemtype[0],'aggregateitemtype');
        $aggregateitem->position = $j+1;
        $aggregateitem->Save();
        $aggregatecolumn->aggregateitem[$j] = $aggregateitem;
      }
      $aggregatecolumn->position = $i+1;
      $aggregatecolumn->Save();
      $this->aggregatecolumn[$i] = $aggregatecolumn;
    }
    objectbase::Save();
  }

}
?>
