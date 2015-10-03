<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <script type="text/javascript">
     $(function(){
    	 $('#categoryGrid').datagrid({    
    		    url:'categoryQueryAll.html',  
    		    striped : true,
    		    pagination : true,
    		    fitColumns:true,
    		    idField : 'id',
    		    queryParams: {
    				keyword: '',
    			},
    			toolbar: [{
        			text : "修改类别",
    				iconCls: 'icon-edit',
    				handler: function(){
    					var rows = $("#categoryGrid").datagrid('getSelections');
   			         if(rows.length==1){
                             parent.$('#win').window({    
         					    width : 340,    
         					    height : 250,
         					    title : '修改类别', 
         					    content : '<iframe  src="categoryUpdatePage.html" frameborder="0" width="100%" height="100%"/>',
         					    onClose : function(){
         					    	clearRow();
             					}
         					});  
   			         }else{
   			        	 $.messager.alert({
                        		title : '错误提示',
                        		msg : '只能编辑一条数据！',
                        		icon : 'error'
                           });
       			     }
        		    }
    			},'-',{
        			text : '添加类别',
    				iconCls: 'icon-add',
    				handler: function(){
    					parent.$('#win').window({    
    					    width : 340,    
    					    height : 180,
    					    title : '添加类别', 
    					    content : '<iframe  src="categoryAddPage.html" frameborder="0" width="100%" height="100%"/>',
    					    onClose : function(){
    					    	clearRow();
        				    }
                      
    	    		});  
        			}
    			},'-',{
        			text : '删除类别',
    				iconCls: 'icon-remove',
    				handler: function(){
                        var rows = $("#categoryGrid").datagrid('getSelections');
                        if(rows.length>0){
                            var idrows = [];
                        	$.messager.confirm('确认','您确认想要删除记录吗？',function(del){    
                        	 
                        	    	 if (del){    
                              	       for(var i =0 ; i<rows.length ; i++){
                              	    	 idrows.push(rows[i].id);
                                         }    
                                         var testids = $.param({"idkey":idrows},true); 
                                         console.info(testids);      
                                         $.ajax({
                                            url : 'categoryDel.html',
                                            type : 'POST',
                                            data : testids,
                                            success : function(data){
                                            	 console.info(data);
                                                 if(data){
                                                  $('#categoryGrid').datagrid('clearSelections');
                                               	  $('#categoryGrid').datagrid('reload'); 
                                                 }
                                            },
                                         });
                              	    }    
                        	        
                        	}); 
                        }else{
                        	$.messager.alert({
                        		title : '错误提示',
                        		msg : '请选择要删除的行！',
                        		icon : 'error'
                           });
                        }
        		    }
    			},'-',{
        			text : '<input id="searchType" name="searchType">'
    			}], 		    
    		    pageSize : 5,
    		    pageList : [5,10,15,20,25],
    		    columns:[[ 
					{field:'checkbox',checkbox:true},       
    		        {field:'id',title:'ID号',width:100},    
    		        {field:'type',title:'商品类别',width:100},    
    		        {field:'hot',title:'热点',width:100,
    		        	formatter: function(value,row,index){
							if(value){
								return '<input type="checkbox" checked="checked" disabled="disabled">';
 						    }else{
 						    	return '<input type="checkbox" disabled="true">';
 	 						}
        		        }
            		},
    		        {field:'account.login',title:'管理名',width:100,
    		        	formatter: function(value,row,index){
        		         if(row.account!=null&&row.account.login!=null)
    				       return row.account.login;		
    					 }
        		    }
    	 
    		    ]]    
    	});   
     	$('#searchType').searchbox({ 
     		searcher:function(value,name){ 
     			   $("#categoryGrid").datagrid('load',{
                         keyword : value
         		   });
     			}, 
     			prompt:'请输入查询类别' 
        }); 
     });
   </script>
</head>
<body>
<table id="categoryGrid"></table>
</body>
</html>