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
    				handler: function(){alert('编辑按钮')}
    			},'-',{
        			text : '添加类别',
    				iconCls: 'icon-add',
    				handler: function(){alert('添加按钮')}
    			},'-',{
        			text : '删除类别',
    				iconCls: 'icon-remove',
    				handler: function(){
                        var rows = $("#categoryGrid").datagrid('getSelections');
                        if(rows.length>0){
                        	$.messager.confirm('确认','您确认想要删除记录吗？',function(del){    
                        	    if (del){    
                        	        alert('确认删除');    
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