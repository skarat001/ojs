{**
	* templates/reviewer/submission.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Show the reviewer administration page.
	*
	* FIXME: At "Notify The Editor", fix the date.
	*
	*}
	{strip}
	{assign var="articleId" value=$submission->getId()}
	{assign var="reviewId" value=$reviewAssignment->getId()}
	{translate|assign:"pageTitleTranslated" key="submission.page.review" id=$articleId}
	{assign var="pageCrumbTitle" value="submission.review"}
	{include file="common/header.tpl"}
	{/strip}

	<script type="text/javascript">
		{literal}
		<!--
		function confirmSubmissionCheck() {
			if (document.getElementById('recommendation').recommendation.value=='') {
				alert('{/literal}{translate|escape:"javascript" key="reviewer.article.mustSelectDecision"}{literal}');
				return false;
			}
			return confirm('{/literal}{translate|escape:"javascript" key="reviewer.article.confirmDecision"}{literal}');
		}
// -->
{/literal}
</script>
<div id="submissionToBeReviewed">
	<h3>{translate key="reviewer.article.submissionToBeReviewed"}</h3>
	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="article.title"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{$submission->getLocalizedTitle()|strip_unsafe_html}
		</div>
	</div>

	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="article.journalSection"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{$submission->getSectionTitle()|escape}
		</div>
	</div>

	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="article.abstract"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}
		</div>
	</div>

	{assign var=editAssignments value=$submission->getEditAssignments()}
	{foreach from=$editAssignments item=editAssignment}
	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{if !$notFirstEditAssignment}
				{assign var=notFirstEditAssignment value=1}

				{translate key="reviewer.article.submissionEditor"}

				{/if}
			</strong>
		</div>
		<div class="col-md-6"> 
			{assign var=emailString value=$editAssignment->getEditorFullName()|concat:" <":$editAssignment->getEditorEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle()|strip_tags articleId=$articleId}
			{$editAssignment->getEditorFullName()|escape} {icon name="mail" url=$url}
			{if !$editAssignment->getCanEdit() || !$editAssignment->getCanReview()}
			{if $editAssignment->getCanEdit()}
			({translate key="submission.editing"})
			{else}
			({translate key="submission.review"})
			{/if}
			{/if}
			<br/>
			{/foreach}
			{if $notFirstEditAssignment}


			{/if}
		</div>
	</div>
	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="submission.metadata"}
			</strong>
		</div>
		<div class="col-md-6"> 
			<a href="{url op="viewMetadata" path=$reviewId|to_array:$articleId}" class="action" target="_new">{translate key="submission.viewMetadata"}</a>
		</div>
	</div>

</div>
<div class="separator"></div>
<div id="reviewSchedule">
	<h3>{translate key="reviewer.article.reviewSchedule"}</h3>
	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="reviewer.article.schedule.request"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{if $submission->getDateNotified()}{$submission->getDateNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}
		</div>
	</div>

	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="reviewer.article.schedule.response"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{if $submission->getDateConfirmed()}{$submission->getDateConfirmed()|date_format:$dateFormatShort}{else}&mdash;{/if}
		</div>
	</div>

	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="reviewer.article.schedule.submitted"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{if $submission->getDateCompleted()}{$submission->getDateCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}
		</div>
	</div>

	<div class="row">
		<div class="col-md-3"> 
			<strong>
				{translate key="reviewer.article.schedule.due"}
			</strong>
		</div>
		<div class="col-md-6"> 
			{if $submission->getDateDue()}{$submission->getDateDue()|date_format:$dateFormatShort}{else}&mdash;{/if}
		</div>
	</div>

</div>
<div class="separator"></div>

<div id="reviewSteps">
	<h3>{translate key="reviewer.article.reviewSteps"}</h3>

	{include file="common/formErrors.tpl"}

	{assign var="currentStep" value=1}



	{assign var=editAssignments value=$submission->getEditAssignments}
	{* FIXME: Should be able to assign primary editorial contact *}
	{if $editAssignments[0]}{assign var=firstEditAssignment value=$editAssignments[0]}{/if}
	

	<div class="row">
		<div class="col-md-12">
			<ol class="list">
				<li class="list-item">

					<span class="instruct">{translate key="reviewer.article.notifyEditorA"}{if $firstEditAssignment}, {$firstEditAssignment->getEditorFullName()|escape},{/if} {translate key="reviewer.article.notifyEditorB"}</span>

				</li>
				<li>
					<span class="instruct">{translate key="reviewer.article.consultGuidelines"}</span>
				</li>

				<li>

					<span class="instruct">{translate key="reviewer.article.downloadSubmission"}</span>
					<div class="row">
						<div class="col-md-2"> 
							{translate key="submission.response"}
						</div>
						<div class="col-md-8"> 
							{if not $confirmedStatus}
							{url|assign:"acceptUrl" op="confirmReview" reviewId=$reviewId}
							{url|assign:"declineUrl" op="confirmReview" reviewId=$reviewId declineReview=1}

							{if !$submission->getCancelled()}
							<a href="{$acceptUrl}" class="btn btn-success btn-xs"><i class="fa fa-check" ></i> {translate key="reviewer.article.canDoReview"}</a> 

							<a href="{$declineUrl}" class="btn btn-danger btn-xs"><i class="fa fa-times" ></i>{translate key="reviewer.article.cannotDoReview"}</a>
							{else}
							{translate key="reviewer.article.canDoReview"} {icon name="mail" disabled="disabled" url=$acceptUrl}

							{translate key="reviewer.article.cannotDoReview"} {icon name="mail" disabled="disabled" url=$declineUrl}
							{/if}
							{else}
							{if not $declined}{translate key="submission.accepted"}{else}{translate key="submission.rejected"}{/if}
							{/if}
						</div>
					</div>


					{if ($confirmedStatus and not $declined) or not $journal->getSetting('restrictReviewerFileAccess')}
					<div class="row">
						<div class="col-md-2"> 

							{translate key="submission.submissionManuscript"}
						</div>
						<div class="col-md-7"> 

							{if $reviewFile}
							{if $submission->getDateConfirmed() or not $journal->getSetting('restrictReviewerAccessToFile')}
							<a href="{url op="downloadFile" path=$reviewId|to_array:$articleId:$reviewFile->getFileId():$reviewFile->getRevision()}" class="file">{$reviewFile->getFileName()|escape}</a>
							{else}{$reviewFile->getFileName()|escape}{/if}
							&nbsp;&nbsp;{$reviewFile->getDateModified()|date_format:$dateFormatShort}
							{else}
							{translate key="common.none"}
							{/if}

						</div>
					</div>

					<div class="row">
						<div class="col-md-2"> 
							{translate key="article.suppFiles"}

						</div>
						<div class="col-md-4"> 
							{assign var=sawSuppFile value=0}
							{foreach from=$suppFiles item=suppFile}
							{if $suppFile->getShowReviewers() }
							{assign var=sawSuppFile value=1}
							<a href="{url op="downloadFile" path=$reviewId|to_array:$articleId:$suppFile->getFileId()}" class="file">{$suppFile->getFileName()|escape}</a><br />
							{/if}
							{/foreach}

							{if !$sawSuppFile}
							{translate key="common.none"}
							{/if}

						</div>
					</div>
					{else}
					<div class="row">
						<div class="col-md-4"> 
							{translate key="reviewer.article.restrictedFileAccess"}
						</div>
					</div>
					{/if}
				</li>
				{if $currentJournal->getSetting('requireReviewerCompetingInterests')}
				<li>




					{url|assign:"competingInterestGuidelinesUrl" page="information" op="competingInterestGuidelines"}
				</li>
				<li>
					{if not $confirmedStatus or $declined or $submission->getCancelled() or $submission->getRecommendation()}<br/>
					{$reviewAssignment->getCompetingInterests()|strip_unsafe_html|nl2br}
					{else}
					<form action="{url op="saveCompetingInterests" reviewId=$reviewId}" method="post">
						<textarea {if $cannotChangeCI}disabled="disabled" {/if}name="competingInterests" class="textArea" id="competingInterests" rows="5" cols="40">{$reviewAssignment->getCompetingInterests()|escape}</textarea><br />
						<input {if $cannotChangeCI}disabled="disabled" {/if}class="button defaultButton" type="submit" value="{translate key="common.save"}" />
					</form>
					{/if}
				</li>
				{/if}

				<li>

		


				{* $currentJournal->getSetting('requireReviewerCompetingInterests') *}

				{if $reviewAssignment->getReviewFormId()}


				<span class="instruct">{translate key="reviewer.article.enterReviewForm"}</span>


				{if $confirmedStatus and not $declined}
				<a href="{url op="editReviewFormResponse" path=$reviewId|to_array:$reviewAssignment->getReviewFormId()}" class="icon">
					{translate key="submission.reviewForm"}
					{icon name="comment"}
				</a>
				{else}
				{translate key="submission.reviewForm"}
				{icon name="comment" disabled="disabled"}
				{/if}


				{else}{* $reviewAssignment->getReviewFormId() *}

			
				<span class="instruct">{translate key="reviewer.article.enterReviewA"}</span>

				{if $confirmedStatus and not $declined}
				<a href="javascript:openComments('{url op="viewPeerReviewComments" path=$articleId|to_array:$reviewId}');" class="icon">
					{translate key="submission.logType.review"}
					{icon name="comment"}
				</a>
				{else}
				{translate key="submission.logType.review"}
				{icon name="comment" disabled="disabled"}
				{/if}


				{/if}{* $reviewAssignment->getReviewFormId() *}
		</li>
<li>
				
				<span class="instruct">{translate key="reviewer.article.uploadFile"}</span>



				{foreach from=$submission->getReviewerFileRevisions() item=reviewerFile key=key}
				{assign var=uploadedFileExists value="1"}


				{if $key eq "0"}
				{translate key="reviewer.article.uploadedFile"}
				{/if}




				<a href="{url op="downloadFile" path=$reviewId|to_array:$articleId:$reviewerFile->getFileId():$reviewerFile->getRevision()}" class="file">{$reviewerFile->getFileName()|escape}</a>
				{$reviewerFile->getDateModified()|date_format:$dateFormatShort}
				{if ($submission->getRecommendation() === null || $submission->getRecommendation() === '') && (!$submission->getCancelled())}
				<a class="action" href="{url op="deleteReviewerVersion" path=$reviewId|to_array:$reviewerFile->getFileId():$reviewerFile->getRevision()}">{translate key="common.delete"}</a>
				{/if}


				{foreachelse}


				{translate key="reviewer.article.uploadedFile"}


				{translate key="common.none"}


				{/foreach}


				{if $submission->getRecommendation() === null || $submission->getRecommendation() === ''}
				<form method="post" action="{url op="uploadReviewerVersion"}" enctype="multipart/form-data" class="form-inline">
					<input type="hidden" name="reviewId" value="{$reviewId|escape}" />
					<div class="form-group">
					<input type="file" name="upload" class="form-controled"  {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} />
					<input type="submit" name="submit" value="{translate key="common.upload"}" {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} class="btn btn-primary" />
					</div>
				</form>
</li>

				{if $currentJournal->getSetting('showEnsuringLink')}
				<li>
				<span class="instruct">
					<a class="action" href="javascript:openHelp('{get_help_id key="editorial.sectionEditorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.article.ensuringBlindReview"}</a>
				</span>
				</li>
				{/if}
				{/if}


			<li>

				<span class="instruct">{translate key="reviewer.article.selectRecommendation"}</span>
<div class="row">
<div class="col-md-2"> 
				{translate key="submission.recommendation"}
</div>
<div class="col-md-9 	" >

				{if $submission->getRecommendation() !== null && $submission->getRecommendation() !== ''}
				{assign var="recommendation" value=$submission->getRecommendation()}
				<strong>{translate key=$reviewerRecommendationOptions.$recommendation}</strong>&nbsp;&nbsp;
				{$submission->getDateCompleted()|date_format:$dateFormatShort}
				{else}
				<form id="recommendation" method="post" action="{url op="recordRecommendation"}" class="form-inline">
					<input type="hidden" name="reviewId" value="{$reviewId|escape}" />
					<select name="recommendation" class="form-control" {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}disabled="disabled"{/if} >
						{html_options_translate options=$reviewerRecommendationOptions selected=''}
					</select>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" name="submit" onclick="return confirmSubmissionCheck()" class="btn btn-primary" value="{translate key="reviewer.article.submitReview"}" {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}disabled="disabled"{/if} />
				</form>
				{/if}
</div>
</li>
			</ol>
		</div>


	</div>
</div>


<br/>



</div>
{if $journal->getLocalizedSetting('reviewGuidelines') != ''}
<div class="separator"></div>
<div id="reviewerGuidelines">
	<h3>{translate key="reviewer.article.reviewerGuidelines"}</h3>
	<p>{$journal->getLocalizedSetting('reviewGuidelines')|nl2br}</p>
</div>
{/if}

{include file="common/footer.tpl"}


