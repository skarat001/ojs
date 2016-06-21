{**
 * templates/sectionEditor/submission/layout.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the layout editing table.
 *
 *}
{assign var=layoutSignoff value=$submission->getSignoff('SIGNOFF_LAYOUT')}
{assign var=layoutFile value=$submission->getFileBySignoffType('SIGNOFF_LAYOUT')}
{assign var=layoutEditor value=$submission->getUserBySignoffType('SIGNOFF_LAYOUT')}

<div id="layout">
<h3>{translate key="submission.layout"}</h3>

{if $useLayoutEditors}
<div id="layoutEditors">
<div class="row">
<div class="col-md-3">
		{translate key="user.role.layoutEditor"}
			</div>
			<div class="col-md-4" >
		{if $layoutSignoff->getUserId()}<td width="20%" class="value">{$layoutEditor->getFullName()|escape}</td>{/if}
		</div>
		<div class="col-md-3">
		<a href="{url op="assignLayoutEditor" path=$submission->getId()}" class="btn btn-default">{translate key="submission.layout.assignLayoutEditor"}</a>
		</div>
		</div>
</div>
{/if}

<table width="100%" class="table table-striped">
<thead>
	<tr>
		<th width="28%" colspan="2">&nbsp;</th>
		<th width="18%" class="heading">{translate key="submission.request"}</th>
		<th width="16%" class="heading">{translate key="submission.underway"}</th>
		<th width="16%" class="heading">{translate key="submission.complete"}</th>
		<th width="22%" colspan="2" class="heading">{translate key="submission.acknowledge"}</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td colspan="2">
			{translate key="submission.layout.layoutVersion"}
		</td>
		<td>
			{if $useLayoutEditors}
				{if $layoutSignoff->getUserId() && $layoutFile}
					{url|assign:"url" op="notifyLayoutEditor" articleId=$submission->getId()}
					{if $layoutSignoff->getDateUnderway()}
						{translate|escape:"javascript"|assign:"confirmText" key="sectionEditor.layout.confirmRenotify"}
						{icon name="mail" onclick="return confirm('$confirmText')" url=$url}
					{else}
						{icon name="mail" url=$url}
					{/if}
				{else}
					{icon name="mail" disabled="disable"}
				{/if}
				{$layoutSignoff->getDateNotified()|date_format:$dateFormatShort|default:""}
			{else}
				{translate key="common.notApplicableShort"}
			{/if}
		</td>
		<td>
			{if $useLayoutEditors}
				{$layoutSignoff->getDateUnderway()|date_format:$dateFormatShort|default:"&mdash;"}
			{else}
				{translate key="common.notApplicableShort"}
			{/if}
		</td>
		<td>
			{if $useLayoutEditors}
				{$layoutSignoff->getDateCompleted()|date_format:$dateFormatShort|default:"&mdash;"}
			{else}
				{translate key="common.notApplicableShort"}
			{/if}
		</td>
		<td colspan="2">
			{if $useLayoutEditors}
				{if $layoutSignoff->getUserId() &&  $layoutSignoff->getDateCompleted() && !$layoutSignoff->getDateAcknowledged()}
					{url|assign:"url" op="thankLayoutEditor" articleId=$submission->getId()}
					{icon name="mail" url=$url}
				{else}
					{icon name="mail" disabled="disable"}
				{/if}
				{$layoutSignoff->getDateAcknowledged()|date_format:$dateFormatShort|default:""}
			{else}
				{translate key="common.notApplicableShort"}
			{/if}
		</td>
	</tr>
	<tr valign="top">
		<td colspan="6">
			{translate key="common.file"}:&nbsp;&nbsp;&nbsp;&nbsp;
			{if $layoutFile}
				<a href="{url op="downloadFile" path=$submission->getId()|to_array:$layoutFile->getFileId()}" class="file">{$layoutFile->getFileName()|escape}</a>&nbsp;&nbsp;{$layoutFile->getDateModified()|date_format:$dateFormatShort}
			{else}
				{translate key="submission.layout.noLayoutFile"}
			{/if}
		</td>
	</tr>


	<tr>
		<th colspan="2">{translate key="submission.layout.galleyFormat"}</th>
		<th colspan="2" class="heading">{translate key="common.file"}</th>
		<th class="heading">{translate key="common.order"}</th>
		<th class="heading">{translate key="common.action"}</th>
		<th class="heading">{translate key="submission.views"}</th>
	</tr>
	{foreach name=galleys from=$submission->getGalleys() item=galley}
	<tr>
		<td width="2%">{$smarty.foreach.galleys.iteration}.</td>
		<td width="26%">{$galley->getGalleyLabel()|escape}{if !$galley->getRemoteURL()} &nbsp; <a href="{url op="proofGalley" path=$submission->getId()|to_array:$galley->getId()}" class="action">{translate key="submission.layout.viewProof"}</a>{/if}</td>
		<td colspan="2">{if $galley->getFileId() > 0}<a href="{url op="downloadFile" path=$submission->getId()|to_array:$galley->getFileId()}" class="file">{$galley->getFileName()|escape}</a>&nbsp;&nbsp;{$galley->getDateModified()|date_format:$dateFormatShort}{elseif $galley->getRemoteURL() != ''}<a href="{$galley->getRemoteURL()|escape}" target="_blank">{$galley->getRemoteURL()|truncate:20:"..."|escape}</a>{/if}</td>
		<td><a href="{url op="orderGalley" d=u articleId=$submission->getId() galleyId=$galley->getId()}" class="plain">&uarr;</a> <a href="{url op="orderGalley" d=d articleId=$submission->getId() galleyId=$galley->getId()}" class="plain">&darr;</a></td>
		<td>
			<a href="{url op="editGalley" path=$submission->getId()|to_array:$galley->getId()}" class="btn btn-warning">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteGalley" path=$submission->getId()|to_array:$galley->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.layout.confirmDeleteGalley"}')" class="btn btn-danger">{translate key="common.delete"}</a>
		</td>
		<td>{$galley->getViews()|escape}</td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="7" class="nodata">{translate key="common.none"}</td>
	</tr>
	{/foreach}

	<tr>
		<th width="28%" colspan="2">{translate key="submission.supplementaryFiles"}</th>
		<th width="34%" colspan="2" class="heading">{translate key="common.file"}</th>
		<th width="16%" class="heading">{translate key="common.order"}</th>
		<th width="16%" colspan="2" class="heading">{translate key="common.action"}</th>
	</tr>
	{foreach name=suppFiles from=$submission->getSuppFiles() item=suppFile}
	<tr>
		<td width="2%">{$smarty.foreach.suppFiles.iteration}.</td>
		<td width="26%">{$suppFile->getSuppFileTitle()|escape}</td>
		<td colspan="2">{if $suppFile->getFileId() > 0}<a href="{url op="downloadFile" path=$submission->getId()|to_array:$suppFile->getFileId()}" class="file">{$suppFile->getFileName()|escape}</a>&nbsp;&nbsp;{$suppFile->getDateModified()|date_format:$dateFormatShort}{elseif $suppFile->getRemoteURL() != ''}<a href="{$suppFile->getRemoteURL()|escape}" target="_blank">{$suppFile->getRemoteURL()|truncate:20:"..."|escape}</a>{/if}</td>
		<td><a href="{url op="orderSuppFile" d=u articleId=$submission->getId() suppFileId=$suppFile->getId()}" class="plain">&uarr;</a> <a href="{url op="orderSuppFile" d=d articleId=$submission->getId() suppFileId=$suppFile->getId()}" class="plain">&darr;</a></td>
		<td colspan="2">
			<a href="{url op="editSuppFile" from="submissionEditing" path=$submission->getId()|to_array:$suppFile->getId()}" class="btn btn-warning btn-sm">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="deleteSuppFile" from="submissionEditing" path=$submission->getId()|to_array:$suppFile->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.layout.confirmDeleteSupplementaryFile"}')" class="btn btn-danger btn-sm">{translate key="common.delete"}</a>
		</td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="7" class="nodata">{translate key="common.none"}</td>
	</tr>
	{/foreach}

	</tbody>
</table>
<div class="row">
<div class="col-md-3">
	{translate key="submission.uploadFileTo"} 
</div>
<div class="col-md-9">
<form method="post" action="{url op="uploadLayoutFile"}"  enctype="multipart/form-data" class="form-inline">
	<input type="hidden" name="from" value="submissionEditing" />
	<input type="hidden" name="articleId" value="{$submission->getId()}" />
	<div class="form-group">

	<input type="radio" name="layoutFileType" id="layoutFileTypeSubmission" value="submission" checked="checked" /><label for="layoutFileTypeSubmission">{translate key="submission.layout.layoutVersion"}</label>, <input type="radio" name="layoutFileType" id="layoutFileTypeGalley" value="galley" /><label for="layoutFileTypeGalley">{translate key="submission.galley"}</label>, <input type="radio" name="layoutFileType" id="layoutFileTypeSupp" value="supp" /><label for="layoutFileTypeSupp">{translate key="article.suppFilesAbbrev"}</label>
</div>
<div class="form-group">
	<input type="file" name="layoutFile" size="10" class="form-control" />
	<input type="submit" value="{translate key="common.upload"}" class="btn btn-primary" />
	<br />
	</div>
	<div class="form-group">
 <input type="radio" name="layoutFileType" id="layoutFileTypeGalley" value="galley" /><label for="layoutFileTypeGalley">{translate key="submission.galley"}</label>, <input type="radio" name="layoutFileType" id="layoutFileTypeSupp" value="supp" /><label for="layoutFileTypeSupp">{translate key="article.suppFilesAbbrev"}</label>
	<input type="submit" name="createRemote" value="{translate key="common.create"}" class="btn btn-default" />
	</div>
</form>
</div>
</div>
<div id="layoutComments">
<div class="row">
<div class="col-md-3">

{translate key="submission.layout.layoutComments"}
</div>
<div class="col-md-5"> 
{if $submission->getMostRecentLayoutComment()}
	{assign var="comment" value=$submission->getMostRecentLayoutComment()}
	<a href="javascript:openComments('{url op="viewLayoutComments" path=$submission->getId() anchor=$comment->getId()}');" class="icon">{icon name="comment"}</a> {$comment->getDatePosted()|date_format:$dateFormatShort}
{else}
	<a href="javascript:openComments('{url op="viewLayoutComments" path=$submission->getId()}');" class="icon">{icon name="comment"}</a> {translate key="common.noComments"}
{/if}

{if $currentJournal->getLocalizedSetting('layoutInstructions')}
&nbsp;&nbsp;
<a href="javascript:openHelp('{url op="instructions" path="layout"}')" class="btn btn-link">{translate key="submission.layout.instructions"}</a>
{/if}
{if $currentJournal->getSetting('provideRefLinkInstructions')}
&nbsp;&nbsp;
<a href="javascript:openHelp('{url op="instructions" path="referenceLinking"}')" class="btn btn-link">{translate key="submission.layout.referenceLinking"}</a>
{/if}
{foreach name=templates from=$templates key=templateId item=template}
&nbsp;&nbsp;&nbsp;&nbsp;<a href="{url op="downloadLayoutTemplate" path=$submission->getId()|to_array:$templateId}" class="btn btn-link">{$template.title|escape}</a>
{/foreach}
</div>
</div>
</div>
</div>

