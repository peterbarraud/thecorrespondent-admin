'use strict';

/**
 * @ngdoc function
 * @name thecorrespondentApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the thecorrespondentApp
 */
angular.module('thecorrespondentApp')
  .controller('PageManagerCtrl', ['$scope','serverFactory', function($scope,serverFactory) {
    serverFactory.getitemsorderbyattr('pageitem','modifieddate','desc',$scope,'gotpageitems');
    serverFactory.getitems('pagetemplate',$scope,'gotpagetemplates');
    serverFactory.getitems('aggregateitemtype',$scope,'gotaggregateitemtypes');
    serverFactory.getmenu($scope,'gotmenu');
    $scope.pidetailsurl = 'picontent';
    $scope.listview = 'pageview';


    $scope.gotpageitems = function(data){
      $scope.pageitems = data.Items;
      $('#waitmodal').modal('hide');
      $scope.pageloadingcounter -= 1;
    };

    $scope.gotpagetemplates = function(data){
      $scope.pagetemplates = data.Items;
    };

    $scope.gotaggregateitemtypes = function(data){
      $scope.aggregateitemtypes = data.Items;
    };

    $scope.gotmenu = function(data){
      $scope.sitemenu = data;
      $('#waitmodal').modal('hide');
    };


    $scope.pagelistitemstyle = function(pageitemid){
      var retval = 'list-group-item';
      if (angular.isDefined($scope.pageitemdata)){
        if (pageitemid === $scope.pageitemdata.id){
          retval += ' active';
        }

      }
      return retval;
    };

    $scope.menulistitemstyle = function(pageitemid){
      var retval = 'btn btn-primary btn-xs';
      if (angular.isDefined($scope.pageitemdata)){
        if (pageitemid === $scope.pageitemdata.id){
          retval += ' active';
        }

      }
      return retval;
    };
    $scope.disablesave = function (){
      var retval = true;
      // make sure that a page item is available to save
      if (angular.isDefined($scope.pageitemdata)){
        // if a page item is avialable make sure that all the required fields are filled
        if ($scope.pageitemdata.title !== null){
          retval = false;
        }
      }
      return retval;
    };

    $scope.getthisitemdetails = function(pageitemid){
      serverFactory.getitem(pageitemid,'pageitem',$scope,'gotpageitem');
    };
    $scope.gotpageitem = function (data){
      $scope.pageitemdata = data;
      $scope.pagetemplate = $scope.pageitemdata.pagetemplate[0];
      $scope.pagetemplate.url = 'views/' + $scope.pageitemdata.pagetemplate[0].pagetype + ".html";
      serverFactory.getpageitemdetailsdata($scope,'gotpageitemdetailsdata');
    };
    $scope.gotpageitemdetailsdata = function (data){
      $scope.pageitemdetailsdata = data;
      $('#waitmodal').modal('hide');
    };

    // new page of a selected template
    $scope.newpage = function (pagetemplate){
      $('#waitmodal').modal('show');
      $scope.pagetemplate = pagetemplate;
      $scope.pagetemplate.url = 'views/' + $scope.pagetemplate.pagetype + ".html";
      serverFactory.getitem(-1,'pageitem',$scope,'gotnewpageitem');
    };

    $scope.gotnewpageitem = function (data){
      $scope.pageitemdata = data;
      $scope.pageitemdata.pagetemplate.push($scope.pagetemplate);
      serverFactory.getitem(-1,$scope.pagetemplate.pagetype,$scope,'gotdetailspage');
    };
    $scope.gotdetailspage = function (data){
      $scope.pageitemdetailsdata = data;
      $('#waitmodal').modal('hide');
    };
    // new page of a selected template - END

    // save a page item
    $scope.save = function (){
      $('#waitmodal').modal('show');
      serverFactory.saveitemdetails($scope,$scope.pageitemdetailsdata,$scope.pagetemplate.pagetype,'savedpageitemdetails');
    };
    $scope.savedpageitemdetails = function (data){
      $scope.pageitemdetailsdata = data;
      $scope.pageitemdata[$scope.pagetemplate.pagetype].push($scope.pageitemdetailsdata);
      serverFactory.saveitemdetails($scope,$scope.pageitemdata,'pageitem','savedpageitem');
    };
    $scope.savedpageitem = function (data){
      $scope.pageitemdata = data;
      serverFactory.getitemsorderbyattr('pageitem','modifieddate','desc',$scope,'gotpageitems');
    };
    // save a page item - END

    // aggregate page
    $scope.layoutcolselect = function() {
      serverFactory.getemptylayoutcolumns($scope,'gotemptylayoutcolumns');
    };
    $scope.gotemptylayoutcolumns = function(data) {
      $scope.pageitemdetailsdata.aggregatecolumn = data;
    };
    $scope.getlayoutcolumnsize = function() {
      return 'col-xs-' + Math.round(12/$scope.pageitemdetailsdata.aggregatecolumn.length);
    };
    $scope.addaggregateitemtocolumn = function(layoutcolumn){
      $scope.selectedlayoutcolumn = layoutcolumn;
      $('#waitmodal').modal('show');
      serverFactory.getitem(-1,'aggregateitem',$scope,'gotaggregateitem');
      serverFactory.getitems('tag',$scope,'openavailablelayoutTagsModal');
    };

    $scope.gotaggregateitem = function(data){
      $scope.aggregateitem = data;
      serverFactory.getitems('tag',$scope,'openavailablelayoutTagsModal');
    };

    $scope.openavailablelayoutTagsModal = function(data){
      $scope.availabletaglist = data.Items;
      $scope.layouttag = null;
      $scope.selectedaggregateitemtypeid = -1;
      $scope.aggregateitem.maxlength = -1;
      $('#waitmodal').modal('hide');
      $('#availablelayoutTagsModal').modal('show');
    };

    $scope.islayouttagselected = function(){
      if ($scope.layouttag !== null){
        if ($scope.selectedaggregateitemtypeid > -1){
          return false;
        }
      }
      return true;
    };
    $scope.resetselectedtag = function(){
      $scope.selectedaggregateitemtypeid = -1;
      $scope.aggregateitem.maxlength = -1;
    };
    $scope.addtagtolayoutcolumn = function(){
      var goahead = true;
      angular.forEach ($scope.aggregateitemtypes,function(aggregateitemtype){
        if (aggregateitemtype.id === $scope.selectedaggregateitemtypeid){
          // the following check could have been put into the islayouttagselected function above
          // but that would probably make it a little confusing to users as to why the ok button in the List of Tags dialog is still disabled
          // specifically since the mandatory check is not that obvious
          // so instead we'll alert the user
          if (aggregateitemtype.lengthismandatory === "1" && (isNaN($scope.aggregateitem.maxlength) || $scope.aggregateitem.maxlength < 1)){
            alert("The " + aggregateitemtype.title + " type requires you to enter a maximum length.\nPlease enter a number greater than 0 in the field below.")
            goahead = false;
          }
          else {
            $scope.aggregateitem.aggregateitemtype.push(aggregateitemtype);
          }
        }
      });
      if (goahead){
        $scope.aggregateitem.tag.push($scope.layouttag);
        $scope.selectedlayoutcolumn.aggregateitem.push($scope.aggregateitem);
        $('#availablelayoutTagsModal').modal('hide');
      }
    };

    $scope.removeaggregateitemfromcolumn = function(aggregateitemindex,layoutcolumn){
      layoutcolumn.aggregateitem.splice(aggregateitemindex,1);
    };



    // aggregate page - END

    // story tags
    $scope.opentagsdialog = function() {
      $('#storyTagsModal').modal('show');
    };

    $scope.openaddnewtagdialog = function() {
      serverFactory.getitem(-1,'tag',$scope,'gotnewtag');

    };
    $scope.gotnewtag = function (data){
      $scope.newtag = data;
      $('#createTagsModal').modal('show');
    };
    $scope.savetag = function () {
      serverFactory.saveitemdetails($scope,$scope.newtag,'tag','savedtag');
    };
    $scope.savedtag = function(data){
      if (data.ServerErr.indexOf('Duplicate entry') === 0){
        alert('A tag with this name already exists. Change the name of the tag or click Cancel and then click Open to view the list of available tags.');
      }
      else {
        $('#createTagsModal').modal('hide');
      }
    };

    $scope.getavailabletaglist = function() {
      serverFactory.getitems('tag',$scope,'openavailableTagsdialog');
    };
    $scope.openavailableTagsdialog = function(data) {
      $scope.availabletaglist = data.Items;
      $('#availableTagsModal').modal('show');
    };
    $scope.assigntagtostory = function(tagid){
      angular.forEach ($scope.availabletaglist,function(availabletag){
        if (availabletag.id === tagid){
          $scope.pageitemdata.tag.push(availabletag);
        }
      });
    };
    $scope.unassigntagtostory = function(tagid) {
      var selectedIndex = -1;
      for (var i=0;i<$scope.pageitemdata.tag.length;i++){
        var storytag = $scope.pageitemdata.tag[i];
        if (tagid === storytag.id){
          selectedIndex = i;
          break;
        }
      }
      if (selectedIndex > -1){
        $scope.pageitemdata.tag.splice(selectedIndex,1);
      }
    };

    // story tags - END

    // asset handling

    $scope.openassetBrowserDialog = function(chooseTitleImage){
      // just to make sure, set the variable to false
      $scope.chooseTitleImage = false;
      if (angular.isDefined(chooseTitleImage)){
        $scope.chooseTitleImage = true;
      }
      $('#waitmodal').modal('show');
      serverFactory.getitems('asset',$scope,'gotassets');
    };

    $scope.gotassets = function(data){
      $scope.pageassets = [];
      angular.forEach (data.Items,function(pageasset){
        pageasset.url = 'http://localhost:9000/images/' + pageasset.name;
        $scope.pageassets.push(pageasset)
        console.log(pageasset);
      });
      $('#waitmodal').modal('hide');
      $('#fileBrowserModal').modal('show');
    };

    $scope.uploadfile = function(){
      var file_data = $('#pageasset').prop('files')[0];
      if (angular.isDefined(file_data)){
        $('#waitmodal').modal('show');
        serverFactory.fileupload($scope,file_data,'fileuploaddone');
      }
      else {
        alert('Please select a file to upload');
      }
    };

    $scope.fileuploaddone = function(data){
      $('#pageasset').val('');
      serverFactory.getitems('asset',$scope,'refreshassetlist');
    };

    $scope.refreshassetlist = function(data){
      $scope.pageassets = [];
      angular.forEach (data.Items,function(pageasset){
        pageasset.url = 'http://localhost:9000/images/' + pageasset.name;
        $scope.pageassets.push(pageasset)
      });
      $('#waitmodal').modal('hide');
    };

    $scope.selectimage = function(pageasset){
      // if user chose to add a title image
      if ($scope.chooseTitleImage){
        $scope.pageitemdetailsdata.titleimageurl = pageasset.url;
        $('#fileBrowserModal').modal('hide');
      }
      else {
        window.prompt("Press Ctrl+C on your keyboard to copy the URL of the selected asset. Then close this dialog and use Ctrl+V to paste the URL where required.", pageasset.url);
        $('#fileBrowserModal').modal('hide');
      }
      // alert(imageurl);
    };
    // asset handling

    // site menu
    $scope.addmenu = function(selectedmenu){
      $('#waitmodal').modal('show');
      $scope.selectedmenu = selectedmenu;
      serverFactory.getitem(-1,'menu',$scope,'gotmenutitle');
    };

    $scope.gotmenutitle = function(data){
      $scope.newmenu = data;
      $scope.insertposition = {
        position:angular.isDefined($scope.selectedmenu) ? parseInt($scope.selectedmenu.position) : 0,
        relation:'after',
      };
      $('#waitmodal').modal('hide');
      $('#menutitledialog').modal('show');
    };

    $scope.savemenutitle = function(data){
      serverFactory.insertafter($scope,$scope.newmenu,$scope.insertposition.position,'menu','savedmenu');
    };
    $scope.savedmenu = function(){
      serverFactory.getmenu($scope,'gotmenu');
      $('#menutitledialog').modal('hide');
    };

    $scope.removemenu = function(selectedmenu){
      $('#waitmodal').modal('show');
      serverFactory.deleteitem(selectedmenu.id,'menu',$scope,'removedmenu');
    };
    $scope.removedmenu = function(){
      serverFactory.getmenu($scope,'gotmenu');
    };

    // menu items
    $scope.addmenuitem = function(selectedmenu){
      $scope.selectedmenu = selectedmenu;
      $scope.menuitemtitle = '';
      $('#menuitemdialog').modal('show');
    };

    $scope.savemenuitem = function(){
      $('#menuitemdialog').modal('hide');
      $('#waitmodal').modal('show');
      serverFactory.getitem(-1,'menuitem',$scope,'gotmenuitem');
    };

    $scope.gotmenuitem = function(data){
      var selectedmenuitem = data;
      selectedmenuitem.title = $scope.menuitemtitle;
      selectedmenuitem.pageitem[0] = $scope.selectedpageitem;
      selectedmenuitem.menu = $scope.selectedmenu;
      serverFactory.insertafter($scope,selectedmenuitem,0,'menuitem','savedmenuitem');
    };

    $scope.savedmenuitem = function(data){
      // $scope.selectedmenu.menuitem[0] = data;
      serverFactory.getmenu($scope,'gotmenu');
    };

    $scope.removemenuitem = function(selectedmenuitem){
      $('#waitmodal').modal('show');
      serverFactory.deleteitem(selectedmenuitem.id,'menuitem',$scope,'removemenuitem');
    };
    $scope.removedmenu = function(){
      serverFactory.getmenu($scope,'gotmenu');
      $('#waitmodal').modal('hide');
    };

    // site menu - END

  }]);
