{**
 * templates/manager/sections/sectionForm.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to create/modify a journal section.
 *
 *}
{strip}
{assign var="pageTitle" value="section.section"}
{assign var="pageCrumbTitle" value="section.section"}
{include file="common/header.tpl"}
{/strip}

<form id="section" method="post" action="{url op="updateSection" path=$sectionId}" onsubmit="return checkEditorAssignments()" class="form-horizontal">
<input type="hidden" name="editorAction" value="" />
<input type="hidden" name="userId" value="" />

{literal}
<script type="text/javascript">
<!--

function addSectionEditor(editorId) {
	var sectionForm = document.getElementById('section');
	sectionForm.editorAction.value = "addSectionEditor";
	sectionForm.userId.value = editorId;
	sectionForm.submit();
}

function removeSectionEditor(editorId) {
	var sectionForm = document.getElementById('section');
	sectionForm.editorAction.value = "removeSectionEditor";
	sectionForm.userId.value = editorId;
	sectionForm.submit();
}

function checkEditorAssignments() {
	var isOk = true;
	{/literal}
	{foreach from=$assignedEditors item=editorEntry}
	{assign var=editor value=$editorEntry.user}
	{literal}
		if (!document.getElementById('section').canReview{/literal}{$editor->getId()}{literal}.checked && !document.getElementById('section').canEdit{/literal}{$editor->getId()}{literal}.checked) {
			isOk = false;
		}
	{/literal}{/foreach}{literal}
	if (!isOk) {
		alert({/literal}'{translate|escape:"jsparam" key="manager.sections.form.mustAllowPermission"}'{literal});
		return false;
	}
	return true;
}

// -->
</script>
{/literal}

{include file="common/formErrors.tpl"}
<div id="sectionForm">

{if count($formLocales) > 1}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="formLocale" key="form.formLanguage"}
</div>
<div class="col-md-7 col-sm-7">
			{if $sectionId}{url|assign:"sectionFormUrl" op="editSection" path=$sectionId escape=false}
			{else}{url|assign:"sectionFormUrl" op="createSection" path=$sectionId escape=false}
			{/if}
			{form_language_chooser form="section" url=$sectionFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
	</div>
	</div>

{/if}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="title" required="true" key="section.title"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" id="title" size="40" maxlength="120" class="form-control" />
	</div>
	</div>

	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="abbrev" required="true" key="section.abbreviation"}
</div>
<div class="col-md-7 col-sm-7">
<input type="text" name="abbrev[{$formLocale|escape}]" id="abbrev" value="{$abbrev[$formLocale]|escape}" size="20" maxlength="20" class="form-control" />&nbsp;&nbsp;{translate key="section.abbreviation.example"}
	</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="policy" key="manager.sections.policy"}
</div>
<div class="col-md-7 col-sm-7">
<textarea name="policy[{$formLocale|escape}]" rows="4" cols="40" id="policy" class="textArea">{$policy[$formLocale]|escape}</textarea>
	</div>
	</div>

	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="reviewFormId" key="submission.reviewForm"}
</div>
<div class="col-md-7 col-sm-7">
		<select name="reviewFormId" size="1" id="reviewFormId" class="selectMenu">
			<option value="">{translate key="manager.reviewForms.noneChosen"}</option>
			{html_options options=$reviewFormOptions selected=$reviewFormId}
		</select>
		</div>
	</div>

{call_hook name="Templates::Manager::Sections::SectionForm::AdditionalMetadata" sectionId=$sectionId}
<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel suppressId="true" key="submission.indexing"}
</div>
<div class="col-md-7 col-sm-7">
		{translate key="manager.section.submissionsToThisSection"}<br/>
		<label>
		<input type="checkbox" name="metaReviewed" id="metaReviewed" value="1" {if $metaReviewed}checked="checked"{/if} />



		{translate key="manager.sections.submissionReview"}
	</label>
<label>
		<input type="checkbox" name="abstractsNotRequired" id="abstractsNotRequired" value="1" {if $abstractsNotRequired}checked="checked"{/if} />
		{translate key="manager.sections.abstractsNotRequired"}
	
</label>
<label>
		<input type="checkbox" name="metaIndexed" id="metaIndexed" value="1" {if $metaIndexed}checked="checked"{/if} />
		{translate key="manager.sections.submissionIndexing"}
		</label>
				</div>
	</div>

	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">

		{fieldLabel name="identifyType" key="manager.sections.identifyType"} 
</div>
<div class="col-md-7 col-sm-7">
		<input type="text" name="identifyType[{$formLocale|escape}]" id="identifyType" value="{$identifyType[$formLocale]|escape}" size="20" maxlength="60" class="form-control" />
		<br />
		<span class="instruct">{translate key="manager.sections.identifyTypeExamples"}</span>
				</div>
	</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel suppressId="true" key="submission.restrictions"}
</div>
<div class="col-md-7 col-sm-7">
<label>
		<input type="checkbox" name="editorRestriction" id="editorRestriction" value="1" {if $editorRestriction}checked="checked"{/if} />
		{translate key="manager.sections.editorRestriction"}
		</label>
				</div>
	</div>

		<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel key="manager.sections.wordCount"}
</div>
<div class="col-md-7 col-sm-7">
		{fieldLabel name="wordCount" key="manager.sections.wordCountInstructions"}&nbsp;&nbsp;<input type="text" name="wordCount" id="abbrev" value="{$wordCount}" size="10" maxlength="20" class="form-control" />
				</div>
	</div>

	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
	{fieldLabel name="hideTitle" key="issue.toc"}
</div>
<div class="col-md-7 col-sm-7">
<label>
		<input type="checkbox" name="hideTitle" id="hideTitle" value="1" {if $hideTitle}checked="checked"{/if} />
		{translate key="manager.sections.hideTocTitle"}
</label>
<label>
		<input type="checkbox" name="hideAuthor" id="hideAuthor" value="1" {if $hideAuthor}checked="checked"{/if} />
		{translate key="manager.sections.hideTocAuthor"}
</label>
		</div>
		</div>
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">	
	{fieldLabel name="hideAbout" key="navigation.about"}
</div>
<div class="col-md-7 col-sm-7">
<label>
		<input type="checkbox" name="hideAbout" id="hideAbout" value="1" {if $hideAbout}checked="checked"{/if} />
		{translate key="manager.sections.hideAbout"}
		</label>
				</div>
	</div>


{if $commentsEnabled}
	<div class="form-group">
<div class="col-md-3 col-sm-3 control-label">
{fieldLabel name="disableComments" key="comments.readerComments"}
</div>
<div class="col-md-7 col-sm-7">
<label>
		<input type="checkbox" name="disableComments" id="disableComments" value="1" {if $disableComments}checked="checked"{/if} />
		{translate key="manager.sections.disableComments"}
		</label>
			</div>
	</div>


{/if}


</div>
<div class="separator"></div>
<div id="sectionEditors">
<h3>{translate key="user.role.sectionEditors"}</h3>
{url|assign:"sectionEditorsUrl" op="people" path="sectionEditors"|to_array}
<p><span class="instruct">{translate key="manager.section.sectionEditorInstructions"}</span></p>
<h4>{translate key="manager.sections.unassigned"}</h4>

<table width="100%" class="table table-striped" id="unassignedSectionEditors">
	<thead>
	<tr valign="top" class="heading">
		<th width="20%">{translate key="user.username"}</th>
		<th width="60%">{translate key="user.name"}</th>
		<th width="20%" align="right">{translate key="common.action"}</th>
	</tr>
</thead>
<tbody>
	{foreach from=$unassignedEditors item=editor}
		<tr valign="top">
			<td>{$editor->getUsername()|escape}</td>
			<td>{$editor->getFullName()|escape}</td>
			<td align="right">
				<a class="action" href="javascript:addSectionEditor({$editor->getId()})">{translate key="common.add"}</a>
			</td>
		</tr>
	{foreachelse}
		<tr>
			<td colspan="3" class="nodata">{translate key="common.none"}</td>
		</tr>
	{/foreach}

</tbody>

</table>
</div>
<div id="sectionsAssigned">
<h4>{translate key="manager.sections.assigned"}</h4>

<table width="100%" class="table table-striped" id="assignedSectionEditors">

<thead>
	<tr valign="top" class="heading">
		<th width="20%">{translate key="user.username"}</th>
		<th width="40%">{translate key="user.name"}</th>
		<th width="10%" align="center">{translate key="submission.review"}</th>
		<th width="10%" align="center">{translate key="submission.editing"}</th>
		<th width="20%" align="right">{translate key="common.action"}</th>
	</tr>
</thead>
<tbody>

	{foreach from=$assignedEditors item=editorEntry}
		{assign var=editor value=$editorEntry.user}
		<input type="hidden" name="assignedEditorIds[]" value="{$editor->getId()|escape}" />
		<tr valign="top">
			<td>{$editor->getUsername()|escape}</td>
			<td>{$editor->getFullName()|escape}</td>
			<td align="center"><input type="checkbox" {if $editorEntry.canReview}checked="checked"{/if} name="canReview{$editor->getId()}" /></td>
			<td align="center"><input type="checkbox" {if $editorEntry.canEdit}checked="checked"{/if} name="canEdit{$editor->getId()}" /></td>
			<td align="right">
				<a class="btn btn-success btn-xs" href="javascript:removeSectionEditor({$editor->getId()})">{translate key="common.remove"}</a>
			</td>
		</tr>
	{foreachelse}
		<tr>
			<td colspan="5" class="nodata">{translate key="common.none"}</td>
		</tr>
	{/foreach}
</tbody>

</table>
</div>
<div class="form-group">
<div class="col-md-offset-3">
<p><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-warning" onclick="document.location.href='{url op="sections" escape=false}'" /></p>
</div>
</div>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
{include file="common/footer.tpl"}

