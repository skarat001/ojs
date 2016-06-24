{**
 * templates/user/changePassword.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to change a user's password.
 *
 *}
{strip}
{assign var="pageTitle" value="user.changePassword"}
{url|assign:"currentUrl" page="user" op="changePassword"}
{include file="common/header.tpl"}
{/strip}

<div id="changePassword">
<form method="post" action="{url op="savePassword"}" class="form-horizontal">

{include file="common/formErrors.tpl"}

{if $implicitAuth}
<p><span class="instruct">{translate key="user.profile.implicitAuthChangePasswordInstructions"}</span></p>
{/if}
<p><span class="instruct">{translate key="user.profile.changePasswordInstructions"}</span></p>
<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="oldPassword" key="user.profile.oldPassword"}
</div>
<div class="col-md-7">
<input type="password" name="oldPassword" id="oldPassword" value="{$oldPassword|escape}" size="20" class="form-control" />

	</div>
	</div>

<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="password" key="user.profile.newPassword"}
</div>
<div class="col-md-7">
<input type="password" name="password" value="{$password|escape}" id="password" size="20" class="form-control" /></td>
<span class="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</span>

	</div>
	</div>

<div class="form-group">
<div class="col-md-3 control-label">
{fieldLabel name="password2" key="user.profile.repeatNewPassword"}
</div>
<div class="col-md-7">
<input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="form-control" />

	</div>
	</div>

	<div class="form-group">
<div class="col-md-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url page="user" escape=false}'" /></p>
	</div>
	</div>
</form>
</div>
{include file="common/footer.tpl"}

