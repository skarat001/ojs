{**
	* templates/subscription/subscriptionFormUser.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Common subscription fields
	*
	*}

	<strong>{translate key="manager.subscriptions.form.userProfileInstructions"}</strong>
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userSalutation" key="user.salutation"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userSalutation" id="userSalutation" value="{$userSalutation|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userFirstName" required="true" key="user.firstName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userFirstName" id="userFirstName" value="{$userFirstName|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userMiddleName" key="user.middleName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userMiddleName" id="userMiddleName" value="{$userMiddleName|escape}" size="20" maxlength="40" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userLastName" required="true" key="user.lastName"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userLastName" id="userLastName" value="{$userLastName|escape}" size="20" maxlength="90" class="form-control" />
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userInitials" key="user.initials"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userInitials" id="userInitials" value="{$userInitials|escape}" size="5" maxlength="5" class="form-control" />&nbsp;&nbsp;{translate key="user.initialsExample"}

		</div>
	</div>
	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel suppressId="true" name="userGender" key="user.gender"}
		</div>
		<div class="col-md-6">

			<select name="userGender" id="userGender" size="1" class="form-control">
				{html_options_translate options=$genderOptions selected=$userGender}
			</select>
		</div>
	</div>

	<div class="form-group">
		<div class="col-md-3 control-label">
			{fieldLabel name="userAffiliation" key="user.affiliation"}
		</div>
		<div class="col-md-6">
			<textarea name="userAffiliation[{$formLocale|escape}]" id="userAffiliation" rows="5" cols="40" class="form-control">{$userAffiliation[$formLocale]|escape}</textarea><br/>
			<span class="instruct">{translate key="user.affiliation.description"}</span>
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
			{fieldLabel name="userEmail" required="true" key="user.email"}
		</div>
		<div class="col-md-6">
			<input type="text" name="userEmail" id="userEmail" value="{if $userEmail}{$userEmail|escape}{/if}" size="30" maxlength="90" class="form-control" />
			
			<label for="notifyEmail">
				<input type="checkbox" name="notifyEmail" id="notifyEmail" value="1"{if $notifyEmail} checked="checked"{/if} />

				{translate key="manager.subscriptions.form.notifyEmail"}</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="userPhone" key="user.phone"}
			</div>
			<div class="col-md-6">
				<input type="text" name="userPhone" id="userPhone" value="{$userPhone|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="userFax" key="user.fax"}
			</div>
			<div class="col-md-6">
				<input type="text" name="userFax" id="userFax" value="{$userFax|escape}" size="15" maxlength="24" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="userMailingAddress" key="common.mailingAddress"}
			</div>
			<div class="col-md-6">
				<textarea name="userMailingAddress" id="userMailingAddress" rows="3" cols="40" class="form-control">{$userMailingAddress|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="userCountry" key="common.country"}
			</div>
			<div class="col-md-6">
				<select name="userCountry" id="userCountry" class="form-control">
					<option value=""></option>
					{html_options options=$validCountries selected=$userCountry}
				</select>
			</div>
		</div>

