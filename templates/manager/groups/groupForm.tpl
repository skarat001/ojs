{**
	* templates/manager/groups/groupForm.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Group form under journal management.
	*
	*}
	{strip}
	{assign var="pageId" value="manager.groups.groupForm"}
	{assign var="pageCrumbTitle" value=$pageTitle}
	{include file="common/header.tpl"}
	{/strip}
	<div id="groupFormDiv">
		{if $group}
		<ul class="menu">
			<li class="current"><a href="{url op="editGroup" path=$group->getId()}">{translate key="manager.groups.editTitle"}</a></li>
			<li><a href="{url op="groupMembership" path=$group->getId()}">{translate key="manager.groups.membership}</a></li>
		</ul>
		{/if}

		<br/>

		<form id="groupForm" method="post" action="{url op="updateGroup"}" class="form-horizontal">
			{if $group}
			<input type="hidden" name="groupId" value="{$group->getId()}"/>
			{/if}

			{include file="common/formErrors.tpl"}

			{if count($formLocales) > 1}
			<div class="form-group">
				<div class="col-md-3 col-sm-3 control-label">
					{fieldLabel name="formLocale" key="form.formLanguage"}
				</div>
				<div class="col-md-7 col-sm-7">
					{if $group}{url|assign:"groupFormUrl" op="editGroup" path=$group->getId() escape=false}
					{else}{url|assign:"groupFormUrl" op="createGroup" escape=false}
					{/if}
					{form_language_chooser form="groupForm" url=$groupFormUrl}
					<span class="instruct">{translate key="form.formLanguage.description"}</span>
				</div>
			</div>
			{/if}
<div class="form-group">
				<div class="col-md-3 col-sm-3 control-label">
			{fieldLabel name="title" required="true" key="manager.groups.title"}
			</div>
				<div class="col-md-7 col-sm-7">
			<input type="text" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" size="35" maxlength="80" id="title" class="textField" /></td>

<label>
			<input type="checkbox" name="publishEmail" value="1" {if $publishEmail}checked="checked" {/if} id="publishEmail" />&nbsp;
			{translate key="manager.groups.publishEmails"}
</label>
</div>
			</div>
			<div class="form-group">
				<div class="col-md-3 col-sm-3 control-label">
			{translate key="common.type"}
</div>
				<div class="col-md-8 col-sm-8">
			{foreach from=$groupContextOptions item=groupContextOptionKey key=groupContextOptionValue}
			<label>
			<input type="radio" name="context" value="{$groupContextOptionValue|escape}" {if $context == $groupContextOptionValue}checked="checked" {/if} id="context-{$groupContextOptionValue|escape}" />&nbsp;
			{translate name="context-"|concat:$groupContextOptionValue key=$groupContextOptionKey}</label>
			{/foreach}
</div>
			</div>

<div class="form-group">
<div class="col-md-offet-3 col-sm-offset-3">
			<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="groups" escape=false}'" /></p>
			</div>
			</div>
		</form>

		<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
	</div>
	{include file="common/footer.tpl"}

