{**
 * templates/sectionEditor/submissionHistory.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show submission history page.
 *
 *
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="submission.page.history" id=$submission->getId()}
{assign var="pageCrumbTitle" value="submission.history"}
{include file="common/header.tpl"}
{/strip}

{literal}
<script type="text/javascript">
<!--
	var toggleAll = 0;
	var noteArray = new Array();
	function toggleNote(divNoteId) {
		var domStyle = getBrowserObject(divNoteId,1);
		domStyle.display = (domStyle.display == "block") ? "none" : "block";
	}

	function toggleNoteAll() {
		for(var i = 0; i < noteArray.length; i++) {
			var domStyle = getBrowserObject(noteArray[i],1);
			domStyle.display = toggleAll ? "none" : "block";
		}
		toggleAll = toggleAll ? 0 : 1;

		var collapse = getBrowserObject("collapseNotes",1);
		var expand = getBrowserObject("expandNotes",1);
		if (collapse.display == "inline") {
			collapse.display = "none";
			expand.display = "inline";
		} else {
			collapse.display = "inline";
			expand.display = "none";
		}
	}
// -->
</script>
{/literal}

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
<h3>{translate key="submission.history.submissionEventLog"} - {translate key="submission.history.recentLogEntries"}</h3>
<table width="100%" class="table table-striped">
<thead>
	<tr  valign="bottom">

		<th width="15%">{translate key="common.date"}</th>
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
			{$logEntry->getTranslatedMessage()|strip_tags|truncate:60:"..."}
		</td>
		<td><a href="{url op="submissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-info btn-xs">{translate key="common.view"}</a>{if $isEditor}&nbsp;|&nbsp;<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-danger btn-xs" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmDeleteLogEntry"}')">{translate key="common.delete"}</a>{/if}</td>
	</tr>

{/iterate}
{if $eventLogEntries->wasEmpty()}
	<tr valign="top">
		<td colspan="4" class="nodata">{translate key="submission.history.noLogEntries"}</td>
	</tr>

{/if}
</tbody>
</table>

<a href="{url op="submissionEventLog" path=$submission->getId()}" class="btn btn-info">{translate key="submission.history.viewLog"}</a>{if $isEditor} |
<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()}" class="btn btn-info" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmClearLog"}')">{translate key="submission.history.clearLog"}</a>{/if}
</div>
<br /><br />

<div class="separator"></div>
<div id="submissionEmailLog">
<h3>{translate key="submission.history.submissionEmailLog"} - {translate key="submission.history.recentLogEntries"}</h3>

<table width="100%" class="table table-striped">
	<thead>
	<tr class="heading" valign="bottom">
		<th width="7%">{translate key="common.date"}</th>
		<th width="25%">{translate key="email.sender"}</th>
		<th width="20%">{translate key="email.recipients"}</th>
		<th>{translate key="common.subject"}</th>
		<th width="15%" align="right">{translate key="common.action"}</th>
	</tr>
	</thead>
	<tbody>
{iterate from=emailLogEntries item=logEntry}
	<tr valign="top">
		<td>{$logEntry->getDateSent()|date_format:$dateFormatShort}</td>
		<td>{$logEntry->getFrom()|truncate:40:"..."|escape}</td>
		<td>{$logEntry->getRecipients()|truncate:40:"..."|escape}</td>
		<td>{$logEntry->getSubject()|truncate:60:"..."|escape}</td>
		<td><a href="{url op="submissionEmailLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="btn btn-info btn-xs">{translate key="common.view"}</a>{if $isEditor}&nbsp;|&nbsp;<a href="{url page="editor" op="clearSubmissionEmailLog" path=$submission->getId()|to_array:$logEntry->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.email.confirmDeleteLogEntry"}')" class="btn btn-danger btn-xs">{translate key="common.delete"}</a>{/if}</td>
	</tr>
	
{/iterate}
{if $emailLogEntries->wasEmpty()}
	<tr valign="top">
		<td colspan="5" class="nodata">{translate key="submission.history.noLogEntries"}</td>
	</tr>
	
{/if}
</tbody>
</table>

<a class="btn btn-info" href="{url op="submissionEmailLog" path=$submission->getId()}">{translate key="submission.history.viewLog"}</a>{if $isEditor} |
<a class="btn btn-danger" href="{url page="editor" op="clearsubmissionEmailLog" path=$submission->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.email.confirmClearLog"}')">{translate key="submission.history.clearLog"}</a>{/if}
</div>
<br /><br />

<div class="separator"></div>
<div id="submissionNotes">
<h3>{translate key="submission.notes"}</h3>

<table width="100%" class="table table-striped">
	<thead>
	<tr class="heading" valign="bottom">
		<th width="7%">{translate key="common.date"}</th>
		<th width="53">{translate key="common.title"}</th>
		<th width="25%">{translate key="submission.notes.attachedFile"}</th>
		<th width="15%" align="right">{translate key="common.action"}</th>

{iterate from=submissionNotes item=note}
	<script type="text/javascript">
		<!--
		noteArray.push({$note->getId()});
		// -->
	</script>
	<tr valign="top">
		<td>{$note->getDateCreated()|date_format:$dateFormatShort}</td>
		<td><a class="btn btn-info btn-xs" href="javascript:toggleNote({$note->getId()})">{$note->getTitle()|escape}</a><div style="display: none" id="{$note->getId()}" name="{$note->getId()}">{$note->getNote()|strip_unsafe_html|nl2br}</div></td>
		<td>{if $note->getFileId()}<a class="btn btn-info btn-xs" href="{url op="downloadFile" path=$submission->getId()|to_array:$note->getFileId()}">{$note->getOriginalFileName()|escape}</a>{else}&mdash;{/if}</td>
		<td align="right"><a href="{url op="submissionNotes" path=$submission->getId()|to_array:"edit":$note->getId()}" class="btn btn-danger btn-xs">{translate key="common.view"}</a>&nbsp;|&nbsp;<a href="{url op="removeSubmissionNote" articleId=$submission->getId() noteId=$note->getId() fileId=$note->getFileId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.notes.confirmDelete"}')" class="action">{translate key="common.delete"}</a></td>
	</tr>
	
	</thead>
{/iterate}
{if $submissionNotes->wasEmpty()}
	<tr valign="top">
		<td colspan="6" class="nodata">{translate key="submission.notes.noSubmissionNotes"}</td>
	</tr>

{/if}
</tbody>
</table>

<a class="btn  btn-info" href="{url op="submissionNotes" path=$submission->getId()}">{translate key="submission.notes.viewNotes"}</a> |
<div style="display:inline" id="expandNotes"><a class="btn btn-primary" href="javascript:toggleNoteAll()">{translate key="submission.notes.expandNotes"}</a></div><div style="display: none" id="collapseNotes"><a class="btn btn-primary" href="javascript:toggleNoteAll()">{translate key="submission.notes.collapseNotes"}</a></div> |
<a class="btn btn-success" href="{url op="submissionNotes" path=$submission->getId()|to_array:"add"}">{translate key="submission.notes.addNewNote"}</a> |
<a class="btn btn-danger" href="{url op="clearAllSubmissionNotes" articleId=$submission->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="submission.notes.confirmDeleteAll"}')">{translate key="submission.notes.clearAllNotes"}</a>
</div>
{include file="common/footer.tpl"}

