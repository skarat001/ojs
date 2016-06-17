{**
	* templates/user/register.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* User registration form.
	*
	*}
	{strip}
	{assign var="pageTitle" value="user.register"}
	{include file="common/header.tpl"}
	{/strip}

	{if $implicitAuth === true && !Validation::isLoggedIn()}
	<p><a href="{url page="login" op="implicitAuthLogin"}">{translate key="user.register.implicitAuth"}</a></p>
	{else}
	<form id="registerForm" method="post" action="{url op="registerUser"}" class="form-horizontal">
		<div class="alert alert-info">
			<p>{translate key="user.register.completeForm"}</p>

			{if !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn())}



			{if !$existingUser}
			{url|assign:"url" page="user" op="register" existingUser=1}
			<p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>
			{else}
			{url|assign:"url" page="user" op="register"}
			<p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
			<input type="hidden" name="existingUser" value="1"/>
			{/if}

			{if $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
			<p><a href="{url page="login" op="implicitAuthLogin"}">{translate key="user.register.implicitAuth"}</a></p>
			{/if}
		</div>
		<h3>{translate key="user.profile"}</h3>

		{include file="common/formErrors.tpl"}

		{if $existingUser}
		<p>{translate key="user.register.loginToRegister"}</p>
		{/if}
		{/if}{* !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn()) *}

		{if $source}
		<input type="hidden" name="source" value="{$source|escape}" />
		{/if}
		{/if}{* $implicitAuth === true && !Validation::isLoggedIn() *}



		{if count($formLocales) > 1 && !$existingUser}

		{fieldLabel name="formLocale" key="form.formLanguage"}

		{url|assign:"userRegisterUrl" page="user" op="register" escape=false}
		{form_language_chooser form="registerForm" url=$userRegisterUrl}
		<span class="instruct">{translate key="form.formLanguage.description"}</span>


		{/if}{* count($formLocales) > 1 && !$existingUser *}

		{if !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn())}
		<div class="form-group">
			<div class="row">
				<label class="col-md-3 control-label">
					{fieldLabel name="username" required="true" key="user.username"}
				</label>
				<div class="col-md-6">
					<input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="form-control" />
					<br>
					{if !$existingUser}
					<small>{translate key="user.register.usernameRestriction"}</small>

					{/if}{* !$existingUser *}
					<br>

				</div>
			</div>

		</div>



		<div class="form-group">
			<label class="col-md-3 control-label">

				{fieldLabel name="password" required="true" key="user.password"}
			</label>
			<div class="col-md-5">
				<input type="password" name="password" value="{$password|escape}" id="password" size="20" class="form-control" />
				<br>
				{if !$existingUser}
				<small>{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</small>

			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="password2" required="true" key="user.repeatPassword"}
			</label>
			<div class="col-md-5">
				<input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="form-control" />
			</div>
		</div>
		{if $captchaEnabled}

		{if $reCaptchaEnabled}
		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField"}

				{$reCaptchaHtml}

				{else}
				{fieldLabel name="captcha" required="true" key="common.captchaField"}
			</label>
			<div class="col-md-5">
				<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
				<span class="instruct">{translate key="common.captchaField.description"}</span><br />
				<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="form-control" />
				<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
			</div>
		</div>
		{/if}

		{/if}{* $captchaEnabled *}
		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="salutation" key="user.salutation"}
			</label>
			<div class="col-md-5">
				<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="firstName" required="true" key="user.firstName"}
			</label>
			<div class="col-md-5">
				<input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="middleName" key="user.middleName}
			</label>
			<div class="col-md-5">
				<input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="lastName" required="true" key="user.lastName"}
			</label>
			<div class="col-md-5">
				<input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="initials" key="user.initials"}
			</label>
			<div class="col-md-5">
				<input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="form-control" />&nbsp;&nbsp;
				<small>{translate key="user.initialsExample"}</small>

			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="gender-m" key="user.gender"}
			</label>
			<div class="col-md-5">
				<select name="gender" id="gender" size="1" class="form-control">
					{html_options_translate options=$genderOptions selected=$gender}
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="affiliation" key="user.affiliation"}
			</label>
			<div class="col-md-5">
				<textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="5" cols="40" class="form-control">{$affiliation[$formLocale]|escape}</textarea><br/>
				<span class="instruct">{translate key="user.affiliation.description"}</span>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="signature" key="user.signature"}
			</label>
			<div class="col-md-5">
				<textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea>
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="email" required="true" key="user.email"}
			</label>
			<div class="col-md-5">
				<input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="form-control" /> {if $privacyStatement}<a class="action" href="#privacyStatement">
				{translate key="user.register.privacyStatement"}</a>{/if}
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="confirmEmail" required="true" key="user.confirmEmail"}
			</label>
			<div class="col-md-5">
				<input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="90" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="orcid" key="user.orcid"}
			</label>
			<div class="col-md-5">
				<input type="text" id="orcid" name="orcid" value="{$orcid|escape}" size="40" maxlength="255" class="form-control" /><br />{translate key="user.orcid.description"}
			</div>
		</div>


		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="userUrl" key="user.url"}
			</label>
			<div class="col-md-5">
				<input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="255" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="phone" key="user.phone"}
			</label>
			<div class="col-md-5">
				<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="fax" key="user.fax"}
			</label>
			<div class="col-md-5">
				<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="mailingAddress" key="common.mailingAddress"}
			</label>
			<div class="col-md-5">
				<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="form-control">{$mailingAddress|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="country" key="common.country"}
			</label>
			<div class="col-md-5">
				<select name="country" id="country" class="form-control">
					<option value=""></option>
					{html_options options=$countries selected=$country}
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="biography" key="user.biography"}<br />{translate key="user.biography.description"}
			</label>
			<div class="col-md-5">
				<textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="form-control">{$biography[$formLocale]|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="col-md-3 control-label">
				{fieldLabel name="sendPassword" key="user.sendPassword"}
			</label>
			<div class="col-md-5 checkbox">
				<label for="sendPassword">
					<input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} /> {translate key="user.sendPassword.description"}
				</label>
			</div>
		</div>


		{if count($availableLocales) > 1}
		<div class="form-group">
			<label class="col-md-3 control-label">
				{translate key="user.workingLanguages"}
			</label>
			<div class="col-md-5 checkbox">
				{foreach from=$availableLocales key=localeKey item=localeName}
				<label for="userLocales-{$localeKey|escape}">
					<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> {$localeName|escape}
				</label><br />


				{/foreach}
</div>
				</div>
				{/if}{* count($availableLocales) > 1 *}
				{/if}{* !$existingUser *}
				{/if}{* !$implicitAuth || ($implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL && !Validation::isLoggedIn()) *}


				{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL || ($implicitAuth === true && Validation::isLoggedIn())}
				{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}

				<div class="form-group">
					<label class="col-md-3 control-label">
						{fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs"}
					</label>
					<div class="col-md-5">
						{if $allowRegReader || $allowRegReader === null}
						<label for="registerAsReader">
							<input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if} /> 
							{translate key="user.role.reader"}
						</label>: <small>{translate key="user.register.readerDescription"}</small><br />
						{/if}
						{if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}
						<label for="openAccessNotification">
							<input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} /> {translate key="user.role.reader"}
						</label>: <small>{translate key="user.register.openAccessNotificationDescription"}</small><br />
						{/if}
						{if $allowRegAuthor || $allowRegAuthor === null}
						<label for="registerAsAuthor">
							<input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"{if $registerAsAuthor} checked="checked"{/if} /> {translate key="user.role.author"}
						</label>:<small> {translate key="user.register.authorDescription"}</small><br />
						{/if}
						{if $allowRegReviewer || $allowRegReviewer === null}
						<label for="registerAsReviewer">
							<input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} /> 
							{translate key="user.role.reviewer"}
						</label>: <small>{if $existingUser}
						{translate key="user.register.reviewerDescriptionNoInterests"}{else}{translate key="user.register.reviewerDescription"}{/if}</small>
						<br />
	</div>
				</div>


						<div id="" >

		<div class="form-group">
					<label class="col-md-3 control-label">
							{translate key="user.register.reviewerInterests"}
							</label>
							<div class="col-md-5">
							{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
						</div>
</div>
						{/if}

						{/if}
				


				<br />
				<p><input type="submit" value="{translate key="user.register"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="index" escape=false}'" /></p>
				{/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL || ($implicitAuth === true && Validation::isLoggedIn()) *}


				{if !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL}
				<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

				{/if}{* !$implicitAuth || $implicitAuth === $smarty.const.IMPLICIT_AUTH_OPTIONAL *}

			</form>

			<div id="privacyStatement">
				{if $privacyStatement}
				<h3>{translate key="user.register.privacyStatement"}</h3>
				<p>{$privacyStatement|nl2br}</p>
				{/if}
			</div>

			{include file="common/footer.tpl"}

