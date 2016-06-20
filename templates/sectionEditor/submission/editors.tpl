{**
 * templates/sectionEditor/submission/editors.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the submission editors table.
 *
 *}
<div id="editors">
<h3>{translate key="user.role.editors"}</h3>
<form action="{url page="editor" op="setEditorFlags"}" method="post">
<input type="hidden" name="articleId" value="{$submission->getId()}"/>
<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th width="{if $isEditor}20%{else}25%{/if}">&nbsp;</th>
		<th width="30%">&nbsp;</th>
		<th width="10%">{translate key="submission.review"}</th>
		<th width="10%">{translate key="submission.editing"}</th>
		<th width="{if $isEditor}20%{else}25%{/if}">{translate key="submission.request"}</th>
		{if $isEditor}<th width="10%">{translate key="common.action"}</th>{/if}
	</tr>
	</thead>
	{assign var=editAssignments value=$submission->getEditAssignments()}
	{foreach from=$editAssignments item=editAssignment name=editAssignments}
	{if $editAssignment->getEditorId() == $userId}
		{assign var=selfAssigned value=1}
	{/if}
	<tbody>
		<tr valign="top">
			<td>{if $editAssignment->getIsEditor()}{translate key="user.role.editor"}{else}{translate key="user.role.sectionEditor"}{/if}</td>
			<td>
				{assign var=emailString value=$editAssignment->getEditorFullName()|concat:" <":$editAssignment->getEditorEmail():">"}
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle|strip_tags articleId=$submission->getId()}
				{$editAssignment->getEditorFullName()|escape} {icon name="mail" url=$url}
			</td>
			<td>
				&nbsp;&nbsp;<input
					type="checkbox"
					name="canReview-{$editAssignment->getEditId()}"
					{if $editAssignment->getIsEditor()}
						checked="checked"
						disabled="disabled"
					{else}
						{if $editAssignment->getCanReview()} checked="checked"{/if}
						{if !$isEditor}disabled="disabled"{/if}
					{/if}
				/>
			</td>
			<td>
				&nbsp;&nbsp;<input
					type="checkbox"
					name="canEdit-{$editAssignment->getEditId()}"
					{if $editAssignment->getIsEditor()}
						checked="checked"
						disabled="disabled"
					{else}
						{if $editAssignment->getCanEdit()} checked="checked"{/if}
						{if !$isEditor}disabled="disabled"{/if}
					{/if}
				/>
			</td>
			<td>{if $editAssignment->getDateNotified()}{$editAssignment->getDateNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
			{if $isEditor}
				<td><a href="{url page="editor" op="deleteEditAssignment" path=$editAssignment->getEditId()}" class="btn btn-danger btn-xs">{translate key="common.delete"}</a></td>
			{/if}
		</tr>
	{foreachelse}
		<tr><td colspan="{if $isEditor}6{else}5{/if}" class="nodata">{translate key="common.noneAssigned"}</td></tr>
	{/foreach}
	</tbody>
</table>
{if $isEditor}

	<input type="submit" class="btn btn-primary" value="{translate key="common.record"}"/>&nbsp;&nbsp;
	<div class="col-md-6 pull-right">
	<a href="{url page="editor" op="assignEditor" path="sectionEditor" articleId=$submission->getId()}" class="btn btn-info">{translate key="editor.article.assignSectionEditor"}</a>
	|&nbsp;<a href="{url page="editor" op="assignEditor" path="editor" articleId=$submission->getId()}" class="btn btn-success">{translate key="editor.article.assignEditor"}</a>
	{if !$selfAssigned}|&nbsp;<a href="{url page="editor" op="assignEditor" path="editor" editorId=$userId articleId=$submission->getId()}" class="action">{translate key="common.addSelf"}</a>
</div>
	{/if}
{/if}
</form>
</div>

