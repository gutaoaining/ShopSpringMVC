<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <script type="text/javascript">
     $(function(){
    	 $('#categoryGrid').datagrid({    
    		    url:'productQueryAll.html',  
    		    striped : true,
    		    pagination : true,
    		    fitColumns:true,
    		    idField : 'id',
    		    queryParams: {
    		    	keyword: '',
    			},
    			toolbar: [{
        			text : "修改商品",
    				iconCls: 'icon-edit',
    				handler: function(){
    					var rows = $("#categoryGrid").datagrid('getSelections');
    			         if(rows.length==1){
                              parent.$('#win').window({    
          					    width : 340,    
          					    height : 250,
          					    title : '修改商品信息', 
          					    content : '<iframe  src="" frameborder="0" width="100%" height="100%"/>'
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
        			text : '添加商品',
    				iconCls: 'icon-add',
    				handler: function(){
    					parent.$('#win').window({    
    					    width : 500,    
    					    height : 300,
    					    title : '添加商品', 
    					    content : '<iframe  src="ProductSavePage.html" frameborder="0" width="100%" height="100%"/>'
    					});  
        		   }
    			},'-',{
        			text : '删除商品',
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
                               	         
                               	         var testids = $.param({'idkey':idrows},true);
                               	         console.info(testids);
                                             $.ajax({
                                             url : 'productDel.html',
                                             type : 'POST',
                                             async : true,
                                             data : testids,
                                             dataType:'json',
                                             success : function(data){
                                                 //console.info(data);
                                                 //后台通过strean的方式返回
                                                  if(data){
                                                	  $('#categoryGrid').datagrid('clearSelections');
                                                	  $('#categoryGrid').datagrid('reload'); 
                                                  }
                                             }
                                          });
                               	    }    
                         	        
                         	}); 
                        }else{
                        	$.messager.alert({
                        		title : '错误提示',
                        		msg : '请选择要删除的商品！',
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
    		        {field:'id',title:'商品编号',width:100},    
    		        {field:'name',title:'商品名称',width:100},    
    		        {field:'remark',title:'简单介绍',width:100},
    		        {field:'category.type',title:'所属类别',width:100,
    		        	formatter: function(value,row,index){
        		         if(row.category!=null&&row.category.type!=null){
    				      	 return row.category.type;
    					 }
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
     			prompt:'请输入查询商品信息' 
        }); 
     });
   </script>
</head>
<body>
<table id="categoryGrid"></table>

</body>
</html>