{**
 * templates/sectionEditor/submissionEventLog.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show submission event log page.
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

<div id="eventLogEntries">
<h3>{translate key="submission.history.submissionEventLog"}</h3>
<table width="100%" class="table table-striped">
<thead>
	
	<tr valign="top" class="heading">
		<th width="15%	%">{translate key="common.date"}</th>
		<th width="15%">{translate key="common.user"}</th>
		<th>{translate key="common.event"}</th>
		<th width="15%" align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
	
	<tbody>
{iterate from=eventLogEntries item=logEntry}
	<tr valign="top">
		<td>{$logEntry->getDateLogged()|date_format:$dateFormatShort}</td>
		<td>
			{assign var=emailString value=$logEntry->getUserFullName()|concat:" <":$logEntry->getUserEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$logEntry->getEventTitle()|translate articleId=$submission->getId()}
			{$logEntry->getUserFullName()|escape} {icon name="mail" url=$url}
		</td>
		<td>
			{translate key=$logEntry->getEventTitle()}
			<br />
			{$logEntry->getTranslatedMessage()|strip_tags|truncate:60:"..."|escape}
		</td>
		<td><a href="{url op="submissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-info btn-xs">{translate key="common.view"}</a>{if $isEditor}&nbsp;|&nbsp;<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-danger btn-xs" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmDeleteLogEntry"}')">{translate key="common.delete"}</a>{/if}</td>
	</tr>
	
{/iterate}
{if $eventLogEntries->wasEmpty()}
	<tr valign="top">
		<td colspan="4" class="nodata">{translate key="submission.history.noLogEntries"}</td>
	</tr>
	

{else}
	<tr>
		<td colspan="2" align="left">{page_info iterator=$eventLogEntries}</td>
		<td colspan="2" align="right">{page_links anchor="eventLogEntries" name="eventLogEntries" iterator=$eventLogEntries}</td>
	</tr>
{/if}
</tbody>
</table>

{if $isEditor}
<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()}" class="btn btn-danger" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmClearLog"}')">{translate key="submission.history.clearLog"}</a>
{/if}
</div>
{include file="common/footer.tpl"}

