{**
 * templates/manager/announcement/announcementForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Announcement form under management.
 *
 *}
{strip}
{assign var="pageCrumbTitle" value="$announcementTitle"}
{if $announcementId}
	{assign var="pageTitle" value="manager.announcements.edit"}
{else}
	{assign var="pageTitle" value="manager.announcements.create"}
{/if}
{assign var="pageId" value="manager.announcement.announcementForm"}
{include file="common/header.tpl"}
{/strip}

<br/>
<div id="announcement">
<form id="announcementForm" method="post" action="{url op="updateAnnouncement"}" class="form-horizontal">
{if $announcementId}
<input type="hidden" name="announcementId" value="{$announcementId|escape}" />
{/if}

{include file="common/formErrors.tpl"}


{if count($formLocales) > 1}

{fieldLabel name="formLocale" key="form.formLanguage"}<

			{if $typeId}{url|assign:"announcementUrl" op="editAnnouncement" path=$announcementId escape=false}
			{else}{url|assign:"announcementUrl" op="createAnnouncement" escape=false}
			{/if}
			{form_language_chooser form="announcementForm" url=$announcementUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		

{/if}

{if $announcementTypes->getCount() != 0}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="typeId" key="manager.announcements.form.typeId"}
</div>
<div class="col-md-7 col-sm-7">
<select name="typeId" id="typeId" class="form-control">
		<option value=""></option>
		{iterate from=announcementTypes item=announcementType}
		<option value="{$announcementType->getId()}"{if $typeId == $announcementType->getId()} selected="selected"{/if}>{$announcementType->getLocalizedTypeName()|escape}</option>
		{/iterate}
	</select>
</div>
</div>
{/if}{* $announcementTypes->getCount() != 0 *}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">

{fieldLabel name="title" required="true" key="manager.announcements.form.title"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" size="40" id="title" maxlength="255" class="form-control" />
</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">

{fieldLabel name="descriptionShort" required="true" key="manager.announcements.form.descriptionShort"}

</div>
<div class="col-md-7 col-sm-7">
<textarea name="descriptionShort[{$formLocale|escape}]" id="descriptionShort" cols="40" rows="6" class="form-control richContent">{$descriptionShort[$formLocale]|escape}</textarea>
		<br />
		<span class="instruct">{translate key="manager.announcements.form.descriptionShortInstructions"}</span>
	</div>
</div>

<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel name="description" key="manager.announcements.form.description"}
	</div>
<div class="col-md-7 col-sm-7">
	<textarea name="description[{$formLocale|escape}]" id="description" cols="40" rows="6" class="form-control richContent">{$description[$formLocale]|escape}</textarea>
		<br />
		<span class="instruct">{translate key="manager.announcements.form.descriptionInstructions"}</span>
	</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel name="datePosted" key="manager.announcements.datePublish"}
</div>
<div class="col-md-7 col-sm-7">
		{html_select_date prefix="datePosted" all_extra="class=\"selectMenu\"" end_year="$yearOffsetFuture" year_empty="" month_empty="" day_empty="" time="$datePosted"}
	</div>
</div>
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel name="dateExpire" key="manager.announcements.form.dateExpire"}
</div>
<div class="col-md-7 col-sm-7">
		{if $dateExpire != null}
			{html_select_date prefix="dateExpire" all_extra="class=\"selectMenu\"" end_year="$yearOffsetFuture" year_empty="" month_empty="" day_empty="" time="$dateExpire"}
		{else}
			{html_select_date prefix="dateExpire" all_extra="class=\"selectMenu\"" end_year="$yearOffsetFuture" year_empty="" month_empty="" day_empty="" time="-00-00"}
		{/if}

		<input type="hidden" name="dateExpireHour" value="23" />
		<input type="hidden" name="dateExpireMinute" value="59" />
		<input type="hidden" name="dateExpireSecond" value="59" />
		<br />
		<span class="instruct">{translate key="manager.announcements.form.dateExpireInstructions"}</span>
			</div>
</div>

<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel name="notificationToggle" key="manager.announcements.form.notificationToggle"}
</div>
<div class="col-md-7 col-sm-7">
		<label><input type="checkbox" name="notificationToggle" id="notificationToggle" value="1" {if $notificationToggle} checked="checked"{/if} />{translate key="manager.announcements.form.notificationToggleInstructions"}</label>
			</div>
</div>

<div class="form-group">
<div class="col-md-offset-2">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> {if not $announcementId}<input type="submit" name="createAnother" value="{translate key="manager.announcements.form.saveAndCreateAnother"}" class="btn btn-primary" /> {/if}<input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="announcements" escape=false}'" /></p>
</div>
</form>
</div>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{include file="common/footer.tpl"}

