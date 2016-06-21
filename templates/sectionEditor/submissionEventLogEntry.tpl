{**
	* templates/sectionEditor/submissionEventLogEntry.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Show a single event log entry.
	*
	*
	*}
	{strip}
	{assign var="pageTitle" value="submission.eventLog"}
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
	<div id="submissionEventLog">
		<h3>{translate key="submission.history.submissionEventLog"}</h3>
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
				{$logEntry->getDateLogged()|date_format:$datetimeFormatLong}
			</div>
		</div>

		<div class="row" >
			<div class="col-md-3">
				<strong>
					{translate key="common.user"}
				</strong>
			</div>
			<div class="col-md-5">
				{assign var=emailString value=$logEntry->getUserFullName()|concat:" <":$logEntry->getUserEmail():">"}
				{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$logEntry->getEventTitle()|translate articleId=$submission->getId()}
				{$logEntry->getUserFullName()|escape} {icon name="mail" url=$url}
			</div>
		</div>

		<div class="row" >
			<div class="col-md-3">
				<strong>
					{translate key="common.event"}
				</strong>
			</div>
			<div class="col-md-5">
				<em>{translate key=$logEntry->getEventTitle()}</em>
				<br /><br />
				{$logEntry->getMessage()|strip_unsafe_html|nl2br}
			</div>
		</div>
		<br/>
		{if $isEditor}
		<div class="row">
			<div class="col-md-6">
			<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmDeleteLogEntry"}')" class="btn btn-danger">{translate key="submission.event.deleteLogEntry"}</a>
				{/if}

				<a class="btn btn-primary" href="{url op="submissionEventLog" path=$submission->getId()}">{translate key="submission.event.backToEventLog"}</a>
			</div>
		</div>
	</div>
	{include file="common/footer.tpl"}

