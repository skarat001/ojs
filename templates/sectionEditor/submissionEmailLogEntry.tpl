{**
	* templates/sectionEditor/submissionEmailLogEntry.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Show a single email log entry.
	*
	*
	*}
	{strip}
	{assign var="pageTitle" value="submission.emailLog"}
	{include file="common/header.tpl"}
	{/strip}

	<ul class="nav nav-pills">
		<li class="nav-item "><a href="{url op="submission" path=$submission->getId()}" class="nav-link">{translate key="submission.summary"}</a></li>
		{if $canReview}<li class="nav-item "><a href="{url op="submissionReview" path=$submission->getId()}" class="nav-link">{translate key="submission.review"}</a></li>{/if}
		{if $canEdit}<li class="nav-item "><a href="{url op="submissionEditing" path=$submission->getId()}" class="nav-link">{translate key="submission.editing"}</a></li>{/if}
		<li class="nav-item active"><a href="{url op="submissionHistory" path=$submission->getId()}" class="nav-link">{translate key="submission.history"}</a></li>
		<li class="nav-item"><a href="{url op="submissionCitations" path=$submission->getId()}" class="nav-link">{translate key="submission.citations"}</a></li>
	</ul>
	<hr>

	{include file="sectionEditor/submission/summary.tpl"}

	<div class="separator"></div>

	<h3>{translate key="submission.history.submissionEmailLog"}</h3>
	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="common.id"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getId()}
		</div>
	</div>
	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="common.date"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getDateSent()|date_format:$datetimeFormatLong}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.sender"}
			</strong>
		</div>
		<div class="col-md-5">
			{if $logEntry->getSenderFullName()}
			{assign var=emailString value=$logEntry->getSenderFullName()|concat:" <":$logEntry->getSenderEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$logEntry->getSubject() articleId=$submission->getId()}
			{$logEntry->getSenderFullName()|escape} {icon name="mail" url=$url}
			{else}
			{translate key="common.notApplicable"}
			{/if}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.from"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getFrom()|escape}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.to"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getRecipients()|escape}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.cc"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getCcs()|escape}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.bcc"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getBccs()|escape}
		</div>
	</div>

	{if !empty($attachments)}
	<div class="row" >
		<div class="col-md-3">
			<strong>	
				{translate key="email.attachments"}
			</strong>
		</div>
		<div class="col-md-5">
			{foreach from=$attachments item=attachment}
			<a href="{url op="downloadFile" path=$attachment->getArticleId()|to_array:$attachment->getFileId()}" class="action">{$attachment->getOriginalFilename()|escape}</a>
			{/foreach}
		</div>
	</div>
	{/if}
	
	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.subject"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getSubject()|escape}
		</div>
	</div>

	<div class="row" >
		<div class="col-md-3">
			<strong>
				{translate key="email.body"}
			</strong>
		</div>
		<div class="col-md-5">
			{$logEntry->getBody()|escape|nl2br}
		</div>
	</div>
	<br/>
	<div class="row col-md-offset-3">
		{if $isEditor}
		<a href="{url page="editor" op="clearSubmissionEmailLog" path=$submission->getId()|to_array:$logEntry->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.email.confirmDeleteLogEntry"}')" class="btn btn-danger">{translate key="submission.email.deleteLogEntry"}</a>
		{/if}

		<a href="{url op="submissionEmailLog" path=$submission->getId()}" class="btn btn-primary">{translate key="submission.email.backToEmailLog"}</a>
	</div>
	{include file="common/footer.tpl"}

