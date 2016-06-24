{**
	* templates/manager/people/userProfileForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* User profile form under journal management.
	*
	*}
	{strip}
	{url|assign:"currentUrl" op="people" path="all"}
	{assign var="pageTitle" value="manager.people"}
	{include file="common/header.tpl"}
	{/strip}

	{if not $userId}
	{assign var="passwordRequired" value="true"}

	{literal}
	<script type="text/javascript">
		<!--
		function setGenerateRandom(value) {
			var userForm = document.getElementById('userForm');
			if (value) {
				userForm.password.value='********';
				userForm.password2.value='********';
				userForm.password.disabled=1;
				userForm.password2.disabled=1;
				userForm.sendNotify.checked=1;
				userForm.sendNotify.disabled=1;
			} else {
				userForm.password.disabled=0;
				userForm.password2.disabled=0;
				userForm.sendNotify.disabled=0;
				userForm.password.value='';
				userForm.password2.value='';
				userForm.password.focus();
			}
		}

		function enablePasswordFields() {
			var userForm = document.getElementById('userForm');
			userForm.password.disabled=0;
			userForm.password2.disabled=0;
		}

		function generateUsername() {
			var userForm = document.getElementById('userForm');
			var req = makeAsyncRequest();

			if (userForm.lastName.value == "") {
				alert("{/literal}{translate key="manager.people.mustProvideName"}{literal}");
				return;
			}

			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					userForm.username.value = req.responseText;
				}
			}
			sendAsyncRequest(req, '{/literal}{url op="suggestUsername" firstName="REPLACE1" lastName="REPLACE2" escape=false}{literal}'.replace('REPLACE1', escape(userForm.firstName.value)).replace('REPLACE2', escape(userForm.lastName.value)), null, 'get');
		}

// -->
</script>
{/literal}
{/if}

{if $userCreated}
<p>{translate key="manager.people.userCreatedSuccessfully"}</p>
{/if}

<h3>{if $userId}{translate key="manager.people.editProfile"}{else}{translate key="manager.people.createUser"}{/if}</h3>

<form id="userForm" method="post" action="{url op="updateUser"}" onsubmit="enablePasswordFields()" class="form-horizontal">
	<input type="hidden" name="source" value="{$source|escape}" />
	{if $userId}
	<input type="hidden" name="userId" value="{$userId|escape}" />
	{/if}

	{include file="common/formErrors.tpl"}


	{if count($formLocales) > 1}
	{fieldLabel name="formLocale" key="form.formLanguage"}

	{url|assign:"userFormUrl" page="manager" op="editUser" path=$userId escape=false}
	{form_language_chooser form="userForm" url=$userFormUrl}
	<span class="instruct">{translate key="form.formLanguage.description"}</span>
	

	{/if}

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="salutation" key="user.salutation"}
		</div>
		<div class="col-md-6">
			<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="firstName" required="true" key="user.firstName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="firstName" id="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="middleName" key="user.middleName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="middleName" id="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="lastName" required="true" key="user.lastName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="lastName" id="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="form-control" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel suppressId="true" name="gender" key="user.gender"}
		</div>
		<div class="col-md-6">
			<select name="gender" id="gender" size="1" class="selectMenu">
				{html_options_translate options=$genderOptions selected=$gender}
			</select>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="initials" key="user.initials"}
		</div>
		<div class="col-md-6">
			<input type="text" name="initials" id="initials" value="{$initials|escape}" size="5" maxlength="5" class="form-control" />&nbsp;&nbsp;{translate key="user.initialsExample"}
		</div>
	</div>

	{if not $userId}
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="enrollAs" key="manager.people.enrollUserAs"}
		</div>
		<div class="col-md-6">
			<select name="enrollAs[]" id="enrollAs" multiple="multiple" size="11" class="form-control">
				{html_options_translate options=$roleOptions selected=$enrollAs}
			</select>
			<br />
			<span class="instruct">{translate key="manager.people.enrollUserAsDescription"}</span>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="username" required="true" key="user.username"}
		</div>
		<div class="col-md-6">
		<div class="row">
		<div class="col-md-9">
			<input type="text" name="username" id="username" value="{$username|escape}" size="20" maxlength="32" class="form-control" />
			</div>
			<div class="col-md-3">
			<input type="button" class="btn btn-default" value="{translate key="common.suggest"}" onclick="generateUsername()" />
			</div></div>
			<br />
			<span class="instruct">{translate key="user.register.usernameRestriction"}</span>
		</div>
	</div>

	{else}
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel suppressId="true" name="username" key="user.username"}
		</div>
		<div class="col-md-6">
			<strong>{$username|escape}</strong>
		</div>
	</div>
	{/if}
	{if $authSourceOptions}
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="authId" key="manager.people.authSource"}
		</div>
		<div class="col-md-6">
			<select name="authId" id="authId" size="1" class="selectMenu">
				<option value=""></option>
				{html_options options=$authSourceOptions selected=$authId}
			</select>
		</div>
	</div>
	{/if}

	{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="password" required=$passwordRequired key="user.password"}
		</div>
		<div class="col-md-6">
			<input type="password" name="password" id="password" value="{$password|escape}" size="20" class="form-control" />
			<br />
			<span class="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</span>
			
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			
			{fieldLabel name="password2" required=$passwordRequired key="user.repeatPassword"}
		</div>
		<div class="col-md-6">
			<input type="password" name="password2"  id="password2" value="{$password2|escape}" size="20" class="form-control" />
			<br/>
			{if $userId}


			{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}<br />{translate key="user.profile.leavePasswordBlank"}
			{else}
			<label for="generatePassword">
				<input type="checkbox" onclick="setGenerateRandom(this.checked)" name="generatePassword" id="generatePassword" value="1"{if $generatePassword} checked="checked"{/if} /> {translate key="manager.people.createUserGeneratePassword"}</label>
				<br/>
				<label for="sendNotify">
				<input type="checkbox" name="sendNotify" id="sendNotify" value="1"{if $sendNotify} checked="checked"{/if} /> {translate key="manager.people.createUserSendNotify"}</label>
				{/if}
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
			</div>
			<div class="col-md-6">
				<input type="checkbox" name="mustChangePassword" id="mustChangePassword" value="1"{if $mustChangePassword} checked="checked"{/if} /> <label for="mustChangePassword">{translate key="manager.people.userMustChangePassword"}</label>
			</div>
		</div>
		{/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL *}

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="affiliation" key="user.affiliation"}
			</div>
			<div class="col-md-6">
				<textarea name="affiliation[{$formLocale|escape}]" id="affiliation" rows="5" cols="40" class="form-control">{$affiliation[$formLocale]|escape}</textarea><br/>
				<span class="instruct">{translate key="user.affiliation.description"}</span>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="signature" key="user.signature"}
			</div>
			<div class="col-md-6">
				<textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="form-control">{$signature[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="email" required="true" key="user.email"}
			</div>
			<div class="col-md-6">
				<input type="text" name="email" id="email" value="{$email|escape}" size="30" maxlength="90" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="orcid" key="user.orcid"}
			</div>
			<div class="col-md-6">
				<input type="text" name="orcid" id="orcid" value="{$orcid|escape}" size="30" maxlength="255" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="userUrl" key="user.url"}
			</div>
			<div class="col-md-6">
				<input type="text" name="userUrl" id="userUrl" value="{$userUrl|escape}" size="30" maxlength="255" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="phone" key="user.phone"}
			</div>
			<div class="col-md-6">
				<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="fax" key="user.fax"}
			</div>
			<div class="col-md-6">
				<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel for="interests" key="user.interests"}
			</div>
			<div class="col-md-6">
				{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="gossip" key="user.gossip"}
			</div>
			<div class="col-md-6">

				<textarea name="gossip[{$formLocale|escape}]" id="gossip" rows="3" cols="40" class="form-control">{$gossip[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="mailingAddress" key="common.mailingAddress"}
			</div>
			<div class="col-md-6">
				<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control">{$mailingAddress|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="country" key="common.country"}
			</div>
			<div class="col-md-6">
				<select name="country" id="country" class="selectMenu">
					<option value=""></option>
					{html_options options=$countries selected=$country}
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="biography" key="user.biography"}<br />{translate key="user.biography.description"}
			</div>
			<div class="col-md-6">
				<textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="form-control">{$biography[$formLocale]|escape}</textarea>
			</div>
		</div>
		{if count($availableLocales) > 1}
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="language" key="user.workingLanguages"}
			</div>
			<div class="col-md-6">
				{foreach from=$availableLocales key=localeKey item=localeName}
<label for="userLocales-{$localeKey|escape}">{$localeName|escape}
				<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if $userLocales && in_array($localeKey, $userLocales)} checked="checked"{/if} /> </label><br />
				{/foreach}
			</div>
		</div>
		{/if}
		<div class="form-group">
			<div class="col-md-7 col-md-offset-3">
				<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> {if not $userId}<input type="submit" name="createAnother" value="{translate key="manager.people.saveAndCreateAnotherUser"}" class="btn btn-primary" /> {/if}<input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="{if $source == ''}history.go(-1);{else}document.location='{$source|escape:"jsparam"}';{/if}" /></p>
			</div>
		</div>
		<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

	</form>

	{if $generatePassword}
	{literal}
	<script type="text/javascript">
		<!--
		setGenerateRandom(1);
		// -->
	</script>
	{/literal}
	{/if}

	{include file="common/footer.tpl"}

