{**
 * templates/sectionEditor/submission/scheduling.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the scheduling table.
 *
 *}
<div id="scheduling">
<h3>{translate key="submission.scheduling"}</h3>


{if !$publicationFeeEnabled || $publicationPayment}
	<form action="{url op="scheduleForPublication" path=$submission->getId()}" method="post" class="form-horizontal">
		<div class="form-group ">
		<div class="col-md-3 control-label">
				{translate key="editor.article.scheduleForPublication"}
		</div>
<div class="col-md-5" >
				{if $publishedArticle}
					{assign var=issueId value=$publishedArticle->getIssueId()}
				{else}
					{assign var=issueId value=0}
				{/if}
				<select name="issueId" id="issueId" class="selectMenu">
					<option value="">{translate key="editor.article.scheduleForPublication.toBeAssigned"}</option>
					{html_options options=$issueOptions|truncate:40:"..." selected=$issueId}
				</select>
			</div>
			</div>
<div class="col-md-6 col-md-offset-3">
				<input type="submit" value="{translate key="common.record"}" class="btn btn-primary" />&nbsp;
				{if $issueId}
					{if $isEditor}
						<a href="{url page="editor" op="issueToc" path=$issueId}" class="btn btn-link">{translate key="issue.toc"}</a>
					{else}
						<a href="{url page="issue" op="view" path=$issueId}" class="btn btn-link">{translate key="issue.toc"}</a>
					{/if}
				{/if}
		</div>
	</form>
	{if $publishedArticle}
		<form action="{url op="setDatePublished" path=$submission->getId()}" method="post" class="form-horizontal">
	<div class="form-group">
	<div class="col-md-3 control-label"> 
					{translate key="editor.issues.published"}>
			</div>
			<div class="col-md-5"> 
					{* Find good values for starting and ending year options *}
					{assign var=currentYear value=$smarty.now|date_format:"%Y"}
					{if $publishedArticle->getDatePublished()}
						{assign var=publishedYear value=$publishedArticle->getDatePublished()|date_format:"%Y"}
						{math|assign:"minYear" equation="min(x,y)-10" x=$publishedYear y=$currentYear}
						{math|assign:"maxYear" equation="max(x,y)+2" x=$publishedYear y=$currentYear}
					{else}
						{* No issue publication date info *}
						{math|assign:"minYear" equation="x-10" x=$currentYear}
						{math|assign:"maxYear" equation="x+2" x=$currentYear}
					{/if}
					{html_select_date prefix="datePublished" time=$publishedArticle->getDatePublished()|default:"---" all_extra="class=\"selectMenu\"" start_year=$minYear end_year=$maxYear year_empty="-" month_empty="-" day_empty="-"}
				</div>
				</div>
				<div class="col-md-6 col-md-offset-3">
					<input type="submit" value="{translate key="common.record"}" class="button defaultButton" />&nbsp;
				</div>
		</form>
	{/if}{* $publishedArticle *}
{else}
<div class="row">
<div class="col-md-12">
	<small>{translate key="editor.article.payment.publicationFeeNotPaid"}</small>
</div>	
</div>
<div class="row">
<div class="col-md-3 col-md-offset-3">
			<form action="{url op="waivePublicationFee" path=$submission->getId()}" method="post" class="form-inline">
			<input type="hidden" name="markAsPaid" value=1 />
			<input type="hidden" name="sendToScheduling" value=1 />
			<input type="submit" value="{translate key="payment.paymentReceived"}" class="btn btn-success" />&nbsp;
			</form>
</div>
<div class="col-md-3 ">
		{if $isEditor}
			
				<form action="{url page="editor" op="waivePublicationFee" path=$submission->getId()}" method="post" class="form-inline">
					<input type="hidden" name="sendToScheduling" value=1 />
					<input type="submit" value="{translate key="payment.waive"}" class="btn btn-warning" />&nbsp;
				</form>
			
		{/if}

{/if}	
</div>
</div>
</div>
