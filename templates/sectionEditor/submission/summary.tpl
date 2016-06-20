{**
 * templates/sectionEditor/submission/summary.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the submission summary table.
 *
 *}
<div id="submission">
<h3>{translate key="article.submission"}</h3>
	<div class="row" >
		<div class="col-md-3 ">
			<strong>
{translate key="article.authors"}
	</strong>
		</div>
		<div class="col-md-6" >

			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$submission->getAuthorEmails() subject=$submission->getLocalizedTitle() articleId=$submission->getId()}
			{$submission->getAuthorString()|escape} {icon name="mail" url=$url}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3 ">
			<strong>
	{translate key="article.title"}
		</strong>
		</div>
		<div class="col-md-6" >
	{$submission->getLocalizedTitle()|strip_unsafe_html}
	</div>
	</div>

	<div class="row" >
		<div class="col-md-3 ">
			<strong>
	{translate key="section.section"}
	</strong>
		</div>
		<div class="col-md-6" >
	{$submission->getSectionTitle()|escape}
	</div>
	</div>

	<div class="row" >
		<div class="col-md-3 ">
			<strong>
	{translate key="user.role.editor"}
	</strong>
		</div>
		<div class="col-md-6" >
			{assign var=editAssignments value=$submission->getEditAssignments()}
			{foreach from=$editAssignments item=editAssignment}
				{assign var=emailString value=$editAssignment->getEditorFullName()|concat:" <":$editAssignment->getEditorEmail():">"}
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle()|strip_tags articleId=$submission->getId()}
				{$editAssignment->getEditorFullName()|escape} {icon name="mail" url=$url}
				{if !$editAssignment->getCanEdit() || !$editAssignment->getCanReview()}
					{if $editAssignment->getCanEdit()}
						({translate key="submission.editing"})
					{else}
						({translate key="submission.review"})
					{/if}
				{/if}
				<br/>
			{foreachelse}
				{translate key="common.noneAssigned"}
			{/foreach}
		</div>
	</div>
</div>

