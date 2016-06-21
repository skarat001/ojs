{**
 * templates/reviewer/active.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show reviewer's active submissions.
 *
 *}
<div id="submissions">
<table class="table table-striped" width="100%">
<thead>
	<tr class="heading" valign="bottom">
		<th width="5%">{sort_heading key="common.id" sort='id'}</th>
		<th width="5%"><span class="disabled">{translate key="submission.date.mmdd"}</span><br />{sort_heading key="common.assigned" sort='assignDate'}</th>
		<th width="5%">{sort_heading key="submissions.sec" sort='section'}</th>
		<th width="70%">{sort_heading key="article.title" sort='title'}</th>
		<th width="5%">{sort_heading key="submission.due" sort='dueDate'}</th>
		<th width="10%">{sort_heading key="submissions.reviewRound" sort='round'}</th>
	</tr>
	</thead>
<tbody>
{iterate from=submissions item=submission}
	{assign var="articleId" value=$submission->getId()}
	{assign var="reviewId" value=$submission->getReviewId()}

	<tr valign="top">
		<td>{$articleId|escape}</td>
		<td>{$submission->getDateNotified()|date_format:$dateFormatTrunc}</td>
		<td>{$submission->getSectionAbbrev()|escape}</td>
		<td><a href="{url op="submission" path=$reviewId}" class="action">{$submission->getLocalizedTitle()|strip_tags|truncate:60:"..."}</a></td>
		<td class="nowrap">{$submission->getDateDue()|date_format:$dateFormatTrunc}</td>
		<td>{$submission->getRound()}</td>
	</tr>

{/iterate}
{if $submissions->wasEmpty()}
<tr>
		<td colspan="6" class="nodata">{translate key="submissions.noSubmissions"}</td>
	</tr>

{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$submissions}</td>
		<td colspan="3" align="right">{page_links anchor="submissions" name="submissions" iterator=$submissions sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</tbody>
</table>
</div>

