<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <script type="text/javascript">
     $(function(){
         var dg =  parent.$('iframe[title="类别管理"]').get(0).contentWindow.$("#categoryGrid");   
         $('input[name=type]').validatebox({    
             required: true,    
             missingMessage : '类型不能为空！' 
         }); 
         $('#cc').combobox({    
        	    url:'comboType.html',  
        	    panelHeight : 'auto',
        	    panelWidth : 120,
        	    width : 120,  
        	    editable : false,
        	    valueField:'id',    
        	    textField:'login'   
         });  
         var row = dg.datagrid('getSelections');
         $('#update_category_form').form('load',{
        		id : row[0].id,
        		type : row[0].type,
        		hot : row[0].hot,
        		aid : row[0].account.id
        });       	         
        $('#update_category_form').form('disableValidation');
        $("#update_category_btn").on('click',function(){
        	$('#update_category_btn').linkbutton('disable');
        	$('#update_category_form').form('enableValidation');
            if($('#update_category_form').form('validate')){
            	$('#update_category_form').form('submit', {    
            	    url:'categoryUpdate.html',      
            	    success : function(data){  
            	    	if(data){ 
            	    	  $('#update_category_btn').linkbutton('enable');          	
            	    	  parent.$('#win').window('close');
            	    	  //通过穿换成dom对象从而拿到相应的节点元素，这是在浏览器不兼容是一种很有效的方法  
                      	  dg.datagrid('reload'); 
                        }   
            	    }    
            	});  
            }
        });
     });
   </script>
</head>
<body>
<form id="update_category_form" method="post">
       <div>
       <label for="type">类别名称:</label>
		<input name="type"/>  
       </div>	
		<br>
		<div>
		<label for="hot">热点:</label>
		<input type="radio" name="hot" value="true"><label for="hot">热点</label>
		<input type="radio" name="hot" value="false"><label for="hot">非热点</label>
		</div>
	
		<br>
		<div>
		<label for="aid">所属管理员:</label>
		<input id="cc" name="aid"> 
		</div>
		<br>
		<div> 
		<a id="update_category_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">更新</a>  
		<input type="hidden" name="id"/>
		</div>
		</form>
     
</body>
</html>