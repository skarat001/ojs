{**
 * templates/user/login.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.login"}
{include file="common/header.tpl"}
{/strip}

{if !$registerOp}
	{assign var="registerOp" value="register"}
{/if}
{if !$registerLocaleKey}
	{assign var="registerLocaleKey" value="user.login.registerNewAccount"}
{/if}

{if $loginMessage}
	<span class="instruct">{translate key="$loginMessage"}</span>
	<br />
	<br />
{/if}

{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<h3>{translate key="user.login.implicitAuth"}</h3>
{/if}
{if $implicitAuth}
	<a id="implicitAuthLogin" href="{url page="login" op="implicitAuthLogin"}">{translate key="user.login.implicitAuthLogin"}</a>
{/if}
{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<h3>{translate key="user.login.localAuth"}</h3>
{/if}
<form class="form-horizontal">

 
</form>

{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<form id="signinForm" method="post" action="{$loginUrl}" class="form-horizontal">
{/if}

{if $error}
<div class="alert alert-danger">
   {translate key="$error" reason=$reason}
</div>
	<!-- <span class="pkp_form_error"></span>
	<br />
	<br /> -->
{/if}

<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}

<div class="form-group">
	
		<label for="loginUsername" class="col-sm-3 control-label">{translate key="user.username"}</label>
		 <div class="col-sm-4">
		<input type="text" id="loginUsername" name="username" value="{$username|escape}" size="20" maxlength="32" class="form-control" />
		</div>
	</div>
	<div class="form-group">
		<label for="loginPassword" class="col-sm-3 control-label">{translate key="user.password"}</label>
		<div class="col-sm-4">
		<input type="password" id="loginPassword" name="password" value="{$password|escape}" size="20" class="form-control" />
		</div>
	</div>
	{if $showRemember}
	
	<div class="checkbox form-group">
	 <div class="col-sm-offset-3 col-sm-5">
	<label for="loginRemember"><input type="checkbox" id="loginRemember" name="remember" value="1"{if $remember} checked="checked"{/if} /> {translate key="user.login.rememberUsernameAndPassword"}</label>
	</div>
</div>
	{/if}{* $showRemember *}


 <div class="form-group">
    <div class="col-sm-offset-3 col-sm-10">
      <input type="submit" value="{translate key="user.login"}" class="btn btn-default" />
    </div>
  </div>

	 <div class="form-group">
    <div class="col-sm-offset-3 col-sm-10">
		{if !$hideRegisterLink}	<a href="{url page="user" op=$registerOp}" class="btn btn-link">{translate key=$registerLocaleKey}</a> {/if}
		<br>
		<a href="{url page="login" op="lostPassword"}" class="btn btn-link">{translate key="user.login.forgotPassword"}</a>
</div>
</div>
<script type="text/javascript">
<!--
	document.getElementById('{if $username}loginPassword{else}loginUsername{/if}').focus();
// -->
</script>
</form>
{/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL *}

{include file="common/footer.tpl"}
