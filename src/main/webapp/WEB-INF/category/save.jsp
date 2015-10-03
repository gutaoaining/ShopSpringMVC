<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <%@ include file="/public/head.jspf"%>
   <script type="text/javascript">
     $(function(){
        $('input[name=type]').validatebox({    
            required: true,    
            missingMessage : '类型不能为空！' 
        }); 
        $('#add_category_form').form('disableValidation');
        $("#add_category_btn").on('click',function(){
        	 $('#add_category_form').form('enableValidation');
            if($('#add_category_form').form('validate')){
            	$('#add_category_form').form('submit', {    
            	    url:'',      
            	    success : function(data){  
                	    var json = eval("("+data+")");   
            	    	if(json.msg){
            	    	  parent.$('#win').window('close');
            	    	  //通过穿换成dom对象从而拿到相应的节点元素，这是在浏览器不兼容是一种很有效的方法  
                      	  parent.$('iframe[title="类别管理"]').get(0).contentWindow.$("#categoryGrid").datagrid('reload'); 
                        }   
            	    }    
            	});  
            }
        });
     });
   </script>
</head>
<body>
<form id="add_category_form" method="post">
       <div>
       <label for="type">类别名称:</label>
		<input name="type" placeholder="类别名称" />  
       </div>	
		<br>
		<div>
		<label for="hot">热点:</label>
		<input type="radio" name="hot" value="true"><label for="hot">热点</label>
		<input type="radio" name="hot" value="false"><label for="hot">非热点</label>
		</div>
	
		<br>
		<div>
		<a id="add_category_btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a>  
		</div>
		</form>
     
</body>
</html>