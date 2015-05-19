<%--
 * 
 * @author Shengzhao Li
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>password</title>
</head>
<body>
<a href="${contextPath}/">Home</a>

<h2>password</h2>

<p>
    grant_type = 'password' 的模式一般用在移动设备上(如IOS,Android), 适用于非浏览器的环境.
    <br/>
    在此提供两种方式来展示该模式.
</p>

<div class="panel panel-default">
    <div class="panel-heading">方式1</div>
    <div class="panel-body">
        <p>
            Java代码, 详见项目中的<code>PasswordOauthHandler.java</code>文件.
            <br/>
            使用HttpClient来向服务器发送请求,处理数据,
            获取access_token并调用资源API <strong class="text-success">[推荐]</strong>
        </p>
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">方式2</div>
    <div class="panel-body">
        <div class="col-md-10">
            <p class="text-muted">
                在页面上点击链接 'Password grant_type' 按钮, 将打开新窗口,展示服务器端响应的JSON数据.
                <br/>
                若是开发者关心请求的参数,可点击'显示请求参数' 展示请求的参数细节.
            </p>

            <form class="form-horizontal" action="${accessTokenUri}" method="post" target="_blank">
                <div class="form-group">
                    <label class="col-sm-2 control-label">accessTokenUri</label>

                    <div class="col-sm-10">
                        <p class="form-control-static"><code>${accessTokenUri}</code></p>
                    </div>
                </div>
                <a href="javascript:void(0);">显示请求参数</a>

                <div ng-controller="PasswordCtrl" class="hidden">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">client_id</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="client_id" required="required"
                                   ng-model="clientId"/>

                            <p class="help-block">客户端从 Oauth Server 申请的client_id, 有的Oauth服务器中又叫 appKey</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">client_secret</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="client_secret" required="required"
                                   ng-model="clientSecret"/>

                            <p class="help-block">客户端从 Oauth Server 申请的client_secret, 有的Oauth服务器中又叫 appSecret</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">grant_type</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="grant_type" readonly="readonly"
                                   ng-model="grantType"/>

                            <p class="help-block">固定值 'password'</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">scope</label>

                        <div class="col-sm-10">
                            <select name="scope" ng-model="scope" class="form-control">
                                <option value="read">read</option>
                                <option value="write">write</option>
                                <option value="read,write">read,write</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">username</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" required="required"
                                   ng-model="username"/>

                            <p class="help-block">用户在 Oauth Server 中的账号名称</p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">password</label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="password" required="required"
                                   ng-model="password"/>

                            <p class="help-block">用户在 Oauth Server 中的账号密码</p>
                        </div>
                    </div>

                    <p class="help-block">
                        说明: 输入框中的参数表示在使用时可以变化的值
                    </p>
                </div>
                <br/>
                <br/>
                <button type="submit" class="btn btn-primary">Password grant_type</button>
            </form>
        </div>
    </div>
</div>

<script>
    var PasswordCtrl = ['$scope', function ($scope) {
        $scope.clientId = "mobile-client";
        $scope.clientSecret = "mobile";
        $scope.grantType = "password";

        $scope.username = "mobile";
        $scope.password = "mobile";
        $scope.scope = "read,write";
    }];
</script>
</body>
</html>