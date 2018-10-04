<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />
    <script src="${ctxStatic}/wx/wxjs/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctxStatic}/wx/wxjs/jquery-labelauty.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/wx/wxcss/jquery-labelauty.css">
    <title>登录</title>
    <meta charset="utf-8">
    <style type="text/css">
    	body{
    		background: #fff;
    	}
        .content{
            max-width: 650px;
            margin: 0 auto;
            font-family: 'Microsoft YaHei';
        }
        .bannerimg{
            display: block;
            margin-top: 40px;
        }
        .inputinfo{
            width: 80%; 
            margin: 20px auto;
        }

        .form-group {
            position: relative;
            font-size: 15px;
            color: #666;
        }
        .form-group + .form-group {
            margin-top: 30px;
        }
        .form-group .form-label {
            position: absolute;
            z-index: 1;
            left: 0;
            top: 5px;
            -webkit-transition: 0.3s;
            transition: 0.3s;
        }
        .form-group .form-control {
            width: 100%;
            position: relative;
            z-index: 3;
            height: 35px;
            background: none;
            border: none;
            padding: 5px 0;
            -webkit-transition: 0.3s;
            transition: 0.3s;
            border-bottom: 1px solid #777;
        }
        .form-group .form-control:invalid {
            outline: none;
        }
        .form-group .form-control:focus, .form-group .form-control:valid {
            outline: none;
            color: #1f72ff;
            font-weight: bolder;
            box-shadow: 0 1px #1f72ff;
            border-color: #1f72ff;
        }
        .form-group .form-control:focus + .form-label, .form-group .form-control:valid + .form-label {
            font-size: 12px;
            -ms-transform: translateY(-15px);
            -webkit-transform: translateY(-15px);
            transform: translateY(-15px);
        }

        ul { list-style-type: none;}
        li { display: inline-block;}
        li { margin: 10px 0;}
        input.labelauty + label { font: 12px "Microsoft Yahei";}
        .dowebok{
            padding: 0px;
        }


        .submitBtn{
            display: block;
            width: 100%;
            margin: 20px auto 15px;
            background: #1f72ff;
            border:1px solid #d8d8d8;
            border-radius: 8px; 
            overflow: hidden;
            text-align: center;
            line-height: 40px;
            color: #fff;
            font-size: 14px;
            font-weight: bolder;
            outline: none;
        }
    </style> 
</head>
<body class="content">
    <img src="../static/wx/wximages/topimg1.jpg" class="bannerimg" alt="图片加载中..." width="100%">
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}" />
    
    <form>
	    <div class="inputinfo">
	        <div class="submitBtn">支付</div>
	    </div>
    </form>
    
<script type="text/javascript">
    $(function() {
    	
        $(':input').labelauty();
    	
        $(".submitBtn").click(function(){
        	var pageContextVal = $("#PageContext").val();
			
        	 $.ajax({
			     type:'POST',
			     url:pageContextVal+'/wi/tieInfo',
			     data:{'no':no,'pwd':pwd,'iType':iType},
			     dataType: "json",
			     success:function(data){
			    	switch(data.code){
				    	case "1" : alert(data.message); break;
						case "0" : 
							window.location.href= pageContextVal+"/wi/indexInfo"; 
							break;
			    	}
			     },
			     error:function(XMLHttpRequest, textStatus, errorThrown){
			    	 alert(XMLHttpRequest.status+"操作失败"+XMLHttpRequest.readyState+"未知错误"+textStatus);
			     }
			    
			 });
        });
    })
</script>

</body>
</html>