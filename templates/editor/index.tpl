{**
 * templates/editor/index.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Editor index.
 *
 *}
{strip}
{assign var="pageTitle" value="editor.home"}
{assign var="pageCrumbTitle" value="user.role.editor"}
{include file="common/header.tpl"}
{/strip}
<div id="articleSubmissions">
<h3>{translate key="article.submissions"}</h3>
<ul class="list-inline">
	<li class=""><a href="{url op="submissions" path="submissionsUnassigned"}" class="btn btn-warning">{translate key="common.queue.short.submissionsUnassigned"}</a></li>
	<li class=""><a href="{url op="submissions" path="submissionsInReview"}" class="btn btn-info">{translate key="common.queue.short.submissionsInReview"}</a></li>
	<li class=""><a href="{url op="submissions" path="submissionsInEditing"}" class="btn btn-primary">{translate key="common.queue.short.submissionsInEditing"}</a></li>
	<li class=""><a href="{url op="submissions" path="submissionsArchives"}" class="btn btn-success	">{translate key="common.queue.short.submissionsArchives"}</a></li>
</ul>

</div>
<hr>



{if !$dateFrom}
{assign var="dateFrom" value="--"}
{/if}

{if !$dateTo}
{assign var="dateTo" value="--"}
{/if}

<script type="text/javascript">
{literal}
<!--
function sortSearch(heading, direction) {
	var submitForm = document.getElementById('submit');
	submitForm.sort.value = heading;
	submitForm.sortDirection.value = direction;
	submitForm.submit();
}
// -->
{/literal}
</script>

<form method="post" id="submit" action="{url path="search"}" class="form-inline">
	{if $section}<input type="hidden" name="section" value="{$section|escape:"quotes"}"/>{/if}
	<input type="hidden" name="sort" value="id"/>
	<input type="hidden" name="sortDirection" value="ASC"/>
	<div class="row">
	<div class="form-group">
	<div class="col-md-12">
	<select name="searchField" size="1" class="form-control">
		{html_options_translate options=$fieldOptions selected=$searchField}
	</select>

	<select name="searchMatch" size="1" class="form-control">
		<option value="contains"{if $searchMatch == 'contains'} selected="selected"{/if}>{translate key="form.contains"}</option>
		<option value="is"{if $searchMatch == 'is'} selected="selected"{/if}>{translate key="form.is"}</option>
		<option value="startsWith"{if $searchMatch == 'startsWith'} selected="selected"{/if}>{translate key="form.startsWith"}</option>
	</select>
	<input type="text" size="15" name="search" class="form-control" value="{$search|escape}" />
</div>
</div>
</div>
<br/>
<div class="row">

	<div class="col-md-3">
	<select name="dateSearchField" size="1" class="form-control">
		{html_options_translate options=$dateFieldOptions selected=$dateSearchField}
	</select>
	</div>
	<div class="col-md-7">
	<div class="col-md-2">
	{translate key="common.between"}
	</div>
	<div class="col-md-10">
	{html_select_date prefix="dateFrom" time=$dateFrom all_extra="class=\"form-control\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+1"}
	</div>
	<br/>
		<div class="col-md-2">
	{translate key="common.and"}
		</div>
	<div class="col-md-10">
	{html_select_date prefix="dateTo" time=$dateTo all_extra="class=\"form-control\"" year_empty="" month_empty="" day_empty="" start_year="-5" end_year="+1"}
	</div>
	<input type="hidden" name="dateToHour" value="23" />
	<input type="hidden" name="dateToMinute" value="59" />
	<input type="hidden" name="dateToSecond" value="59" />

</div>
</div>
	<input type="submit" value="{translate key="common.search"}" class="btn btn-primary" />
</form>
&nbsp;

{if $displayResults}
	<div id="submissions">

<table width="100%" class="table table-striped">
<thead>
	<tr class="heading" valign="bottom">
		<th width="5%">{sort_search key="common.id" sort="id"}</th>
		<th width="5%"><span class="disabled">{translate key="submission.date.mmdd"}</span><br />{sort_search key="submissions.submit" sort="submithate"}</th>
		<th width="5%">{sort_search key="submissions.sec" sort="section"}</th>
		<th width="30%">{sort_search key="article.authors" sort="authors"}</th>
		<th width="40%">{sort_search key="article.title" sort="title"}</th>
		<th width="15%" align="right">{sort_search key="common.status" sort="status"}</th>
	</tr>
</thead>
<tbody>
	{iterate from=submissions item=submission}
	{assign var="highlightClass" value=$submission->getHighlightClass()}
	{assign var="fastTracked" value=$submission->getFastTracked()}
	<tr valign="top"{if $highlightClass || $fastTracked} class="{$highlightClass|escape} {if $fastTracked}fastTracked{/if}"{/if}>
		<td>{$submission->getId()}</td>
		<td>{$submission->getDateSubmitted()|date_format:$dateFormatTrunc}</td>
		<td>{$submission->getSectionAbbrev()|escape}</td>
		<td>{$submission->getAuthorString(true)|truncate:40:"..."|escape}</td>
		<td><a href="{url op="submission" path=$submission->getId()}" class="action">{$submission->getLocalizedTitle()|strip_tags|truncate:60:"..."}</a></td>
		<td align="right">
			{assign var="status" value=$submission->getSubmissionStatus()}
			{if $status == STATUS_ARCHIVED}
				{translate key="submissions.archived"}
			{elseif $status == STATUS_PUBLISHED}
				{print_issue_id articleId=$submission->getId()}
			{elseif $status == STATUS_DECLINED}
				{translate key="submissions.declined"}&nbsp;&nbsp;<a href="{url op="deleteSubmission" path=$articleId}" onclick="return confirm('{translate|escape:"jsparam" key="editor.submissionArchive.confirmDelete"}')" class="action">{translate key="common.delete"}</a>
			{elseif $status==STATUS_QUEUED_UNASSIGNED}{translate key="submissions.queuedUnassigned"}
			{elseif $status==STATUS_QUEUED_EDITING}{translate key="submissions.queuedEditing"}
			{elseif $status==STATUS_QUEUED_REVIEW}{translate key="submissions.queuedReview"}
			{else}{* SUBMISSION_QUEUED -- between cracks? *}
				{translate key="submissions.queued"}
			{/if}
		</td>
	</tr>

{/iterate}
{if $submissions->wasEmpty()}
	<tr>
		<td colspan="6" class="nodata">{translate key="submissions.noSubmissions"}</td>
	</tr>

{else}
	<tr>
		<td colspan="4" align="left">{page_info iterator=$submissions}</td>
		<td align="right" colspan="2">{page_links anchor="submissions" name="submissions" iterator=$submissions searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth dateSearchField=$dateSearchField section=$section sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</tbody>
</table>
</div>
{else}

<div class="separator">&nbsp;</div>

{/if}{* displayResults *}
<div id="issues">
<h3>{translate key="editor.navigation.issues"}</h3>

<ul>
	<li><a href="{url op="createIssue"}">{translate key="editor.navigation.createIssue"}</a></li>
	<li><a href="{url op="notifyUsers"}">{translate key="editor.notifyUsers"}</a></li>
	<li><a href="{url op="futureIssues"}">{translate key="editor.navigation.futureIssues"}</a></li>
	<li><a href="{url op="backIssues"}">{translate key="editor.navigation.issueArchive"}</a></li>
	{call_hook name="Templates::Editor::Index::Issues"}
</ul>
</div>

{call_hook name="Templates::Editor::Index::AdditionalItems"}

{include file="common/footer.tpl"}

