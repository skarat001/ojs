{**
	* templates/subscription/subscriptionTypeForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subscription type form under journal management.
	*
	*}
	{strip}
	{if $typeId}
	{assign var="pageTitle" value="manager.subscriptionTypes.edit"}

	{else}
	{assign var="pageTitle" value="manager.subscriptionTypes.create"}
	{/if}
	{assign var="pageId" value="manager.subscriptionTypes.subscriptionTypeForm"}
	{assign var="pageCrumbTitle" value=$subscriptionTypeTitle}
	{include file="common/header.tpl"}
	{/strip}

	{if $subscriptionTypeCreated}
	<br/>
	{translate key="manager.subscriptionTypes.subscriptionTypeCreatedSuccessfully"}<br />
	{/if}

	<br/>

	<form id="subscriptionType" method="post" action="{url op="updateSubscriptionType"}" class="form-horizontal">
		{if $typeId}
		<input type="hidden" name="typeId" value="{$typeId|escape}" />
		{/if}

		{include file="common/formErrors.tpl"}

		{if count($formLocales) > 1}
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="formLocale" key="form.formLanguage"}
			</div>
			<div class="col-md-6">
				{if $typeId}{url|assign:"subscriptionTypeUrl" op="editSubscriptionType" path=$typeId escape=false}
				{else}{url|assign:"subscriptionTypeUrl" op="createSubscriptionType" escape=false}
				{/if}
				{form_language_chooser form="subscriptionType" url=$subscriptionTypeUrl}
				<span class="instruct">{translate key="form.formLanguage.description"}</span>
			</div>
		</div>

		{/if}

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="name" required="true" key="manager.subscriptionTypes.form.typeName"}
			</div>
			<div class="col-md-6">
				<input type="text" name="name[{$formLocale|escape}]" value="{$name[$formLocale]|escape}" size="35" maxlength="80" id="name" class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="description" key="manager.subscriptionTypes.form.description"}
			</div>
			<div class="col-md-6">
				<textarea name="description[{$formLocale|escape}]" id="description" cols="40" rows="4" class="form-control">{$description[$formLocale]|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="cost" required="true" key="manager.subscriptionTypes.form.cost"}
			</div>
			<div class="col-md-6">
				<input type="text" name="cost" value="{$cost|escape}" size="5" maxlength="10" id="cost" class="form-control" />
				<br />
				<span class="instruct">{translate key="manager.subscriptionTypes.form.costInstructions"}</span>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="currency" required="true" key="manager.subscriptionTypes.form.currency"}
			</div>
			<div class="col-md-6">
				<select name="currency" id="currency" class="form-control">{html_options options=$validCurrencies selected=$currency}</select>
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="format" required="true" key="manager.subscriptionTypes.form.format"}
			</div>
			<div class="col-md-6">
				<select id="format" name="format" class="form-control">{html_options options=$validFormats selected=$format}</select>
			</div>
		</div>
		{if !$typeId}

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="duration" required="true" key="manager.subscriptionTypes.form.duration"}
			</div>
			<div class="col-md-6">
				<input type="radio" name="nonExpiring" id="nonExpiring-0" value="0"{if !$nonExpiring} checked="checked"{/if} />&nbsp;{translate key="manager.subscriptionTypes.form.nonExpiring.expiresAfter"}
				<br/> <input type="text" name="duration" value="{$duration|escape}" size="5" maxlength="10" id="duration" class="form-control" /> {translate key="manager.subscriptionTypes.form.nonExpiring.months"}
				<br/>


				<input type="radio" name="nonExpiring" id="nonExpiring-1" value="1"{if $nonExpiring} checked="checked"{/if} />&nbsp;{translate key="manager.subscriptionTypes.form.nonExpiring.neverExpires"}
			</div>
		</div>

		{elseif $typeId && !$nonExpiring}

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="duration" required="true" key="manager.subscriptionTypes.form.duration"}
			</div>
			<div class="col-md-6">
				<input type="text" name="duration" value="{$duration|escape}" size="5" maxlength="10" id="duration" class="form-control" />
				<br />
				<span class="instruct">{translate key="manager.subscriptionTypes.form.durationInstructions"}</span>
			</div>
		</div>

		{/if}
		{if !$typeId}

		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="subscriptions" key="manager.subscriptionTypes.form.subscriptions"}
			</div>
			<div class="col-md-6">
				<input type="radio" name="institutional" id="institutional-0" value="0"{if !$institutional} checked="checked"{/if} />&nbsp;{translate key="manager.subscriptionTypes.form.individual"}

				<br/>
				<input type="radio" name="institutional" id="institutional-1" value="1"{if $institutional} checked="checked"{/if} />&nbsp;{translate key="manager.subscriptionTypes.form.institutional"}
			</div>
		</div>

		{/if}
		<div class="form-group">
			<div class="col-md-3 control-label">
				{fieldLabel name="options" key="manager.subscriptionTypes.form.options"}
			</div>
			<div class="col-md-8">
			<label class="control-label">
				<input type="checkbox" name="membership" id="membership" value="1"{if $membership} checked="checked"{/if} /> {translate  key="manager.subscriptionTypes.form.membership"}
				</label>

			
				<label class="control-label">
				<input type="checkbox" name="disable_public_display" id="disable_public_display" value="1"{if $disable_public_display} checked="checked"{/if} />{translate key="manager.subscriptionTypes.form.public"}
				</label>
			</div>
</div>

				<div class="form-group">
					<div class="col-md-offset-3 col-md-6">
						<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> {if not $typeId}<input type="submit" name="createAnother" value="{translate key="manager.subscriptionTypes.form.saveAndCreateAnotherType"}" class="btn btn-primary" /> {/if}<input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="subscriptionTypes" escape=false}'" /></p>
					</div>
</div>
				<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
				</form>


				{include file="common/footer.tpl"}

