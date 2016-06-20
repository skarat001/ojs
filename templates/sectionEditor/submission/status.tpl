{**
	* templates/sectionEditor/submission/status.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subtemplate defining the submission status table.
	*}
	<div id="status">
		<h3>{translate key="common.status"}</h3>

		{assign var="status" value=$submission->getSubmissionStatus()}
		<div class="row">
			<div class="col-md-3">
				<strong>		
					{translate key="common.status"}
				</strong>
			</div>
			<div class="col-md-5"> 
				{if $status == STATUS_ARCHIVED}{translate key="submissions.archived"}
				{elseif $status==STATUS_QUEUED_UNASSIGNED}{translate key="submissions.queuedUnassigned"}
				{elseif $status==STATUS_QUEUED_EDITING}{translate key="submissions.queuedEditing"}
				{elseif $status==STATUS_QUEUED_REVIEW}{translate key="submissions.queuedReview"}
				{elseif $status==STATUS_PUBLISHED}{translate key="submissions.published"}&nbsp;&nbsp;&nbsp;&nbsp;{$issue->getIssueIdentification()|escape}
				{elseif $status==STATUS_DECLINED}{translate key="submissions.declined"}
				{/if}
			</div>
			<div class="col-md-4">

				{if $status != STATUS_ARCHIVED}
				<a href="{url op="unsuitableSubmission" articleId=$submission->getId()}" class="btn btn-danger btn-sm">{translate key="editor.article.archiveSubmission"}</a>
				{else}
				<a href="{url op="restoreToQueue" path=$submission->getId()}" class="btn btn-primary btn-sm">{translate key="editor.article.restoreToQueue"}</a>
				{/if}
				
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<strong>
					{translate key="submission.initiated"}
				</strong>
			</div>
			<div class="col-md-6"> 
				{$submission->getDateStatusModified()|date_format:$dateFormatShort}
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<strong>
					{translate key="submission.lastModified"}
				</strong>
			</div>
			<div class="col-md-6"> 
				{$submission->getLastModified()|date_format:$dateFormatShort}
			</div>
		</div>
		{if $enableComments}
		
		{translate key="comments.readerComments"}

		{translate key=$submission->getCommentsStatusString()}

		<form action="{url op="updateCommentsStatus" path=$submission->getId()}" method="post">{translate key="submission.changeComments"} <select name="commentsStatus" size="1" class="selectMenu">{html_options_translate options=$commentsStatusOptions selected=$submission->getCommentsStatus()}</select> <input type="submit" value="{translate key="common.record"}" class="button" /></form><

		{/if}


	</div>

