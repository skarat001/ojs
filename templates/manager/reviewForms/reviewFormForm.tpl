{**
	* templates/manager/reviewForms/reviewFormForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Form to create/modify a review form.
	*
	*}
	{strip}
	{include file="common/header.tpl"}
	{/strip}

	{if $reviewFormId}
	<ul class="nav nav-pills">
		<li class="nav-item active"><a href="{url op="editReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>
		<li class="nav-item"><a href="{url op="reviewFormElements" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.edit"}</a></li>

		<li class="nav-item"><a href="{url op="previewReviewForm" path=$reviewFormId}" class="nav-link">{translate key="manager.reviewForms.preview"}</a></li>
	</ul>
	<hr>


	{/if}

	<br/>

	<form id="reviewFormForm" method="post" action="{url op="updateReviewForm"}" class="form-horizontal">
		{if $reviewFormId}
		<input type="hidden" name="reviewFormId" value="{$reviewFormId}"/>
		{/if}

		{include file="common/formErrors.tpl"}


		{if count($formLocales) > 1}
		<div class="form-group">
			<div class="col-md-3 col-sm-3 control-label">
				{fieldLabel name="formLocale" key="form.formLanguage"}
			</div>
			<div class="col-md-7 col-sm-7">
				{if $reviewFormId}{url|assign:"reviewFormFormUrl" op="editReviewForm" path=$reviewFormId escape=false}
				{else}{url|assign:"reviewFormFormUrl" op="createReviewForm" escape=false}
				{/if}
				{form_language_chooser form="reviewFormForm" url=$reviewFormFormUrl}
				<span class="instruct">{translate key="form.formLanguage.description"}</span>
			</div>
		</div>
		{/if}
		<div class="form-group">
			<div class="col-md-3 col-sm-3 control-label">
				{fieldLabel name="title" required="true" key="manager.reviewForms.title"}
			</div>
			<div class="col-md-7 col-sm-7">
				<input type="text" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" id="title" size="40" maxlength="120" class="form-control" />
			</div>
		</div>

		<div class="form-group">
			<div class="col-md-3 col-sm-3 control-label">
				{fieldLabel name="description" key="manager.reviewForms.description"}
			</div>
			<div class="col-md-7 col-sm-7">
			<textarea name="description[{$formLocale|escape}]" rows="4" cols="40" id="description" class="form-control">{$description[$formLocale]|escape}</textarea>
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-offset-3">
				<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="reviewForms" escape=false}'" /></p>
			</div>
		</div>
	</form>

	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

	{include file="common/footer.tpl"}

