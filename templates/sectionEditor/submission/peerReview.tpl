{**
	* templates/sectionEditor/submission/peerReview.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subtemplate defining the peer review table.
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
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle|strip_tags articleId=$submission->getId()}
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

		<div class="row" >

			<div class="col-md-3 ">

				<strong>
					{translate key="submission.reviewVersion"}
				</strong>

			</div>
			<div class="col-md-9" >

				{if $reviewFile}

				<a href="{url op="downloadFile" path=$submission->getId()|to_array:$reviewFile->getFileId():$reviewFile->getRevision()}" class="file">{$reviewFile->getFileName()|escape}</a>&nbsp;&nbsp;
				{$reviewFile->getDateModified()|date_format:$dateFormatShort}{if $currentJournal->getSetting('showEnsuringLink')}&nbsp;&nbsp;&nbsp;&nbsp;<a class="action" href="javascript:openHelp('{get_help_id key="editorial.sectionEditorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.article.ensuringBlindReview"}</a>{/if}

				{else}
				{translate key="common.none"}
				{/if}

				<form method="post" action="{url op="uploadReviewVersion"}" enctype="multipart/form-data" class="form-inline">
					{translate key="editor.article.uploadReviewVersion"}
					<div class="form-group">
						<input type="hidden" name="articleId" value="{$submission->getId()}" />
						<input type="file" name="upload"   class="form-control" />
						<input type="submit" name="submit" value="{translate key="common.upload"}" class="btn btn-primary" />
					</div>
				</form>
			</h5>
		</div>
	</div>

	{foreach from=$suppFiles item=suppFile}
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
				{if !$notFirstSuppFile}
				{translate key="article.suppFilesAbbrev"}

				{assign var=notFirstSuppFile value=1}
				{/if}
			</strong>
		</div>
		<div class="col-md-6" >
			<form method="post" action="{url op="setSuppFileVisibility"}" class="form-inline">
				<input type="hidden" name="articleId" value="{$submission->getId()}" />
				<input type="hidden" name="fileId" value="{$suppFile->getId()}" />

				{if $suppFile->getFileId() > 0}<a href="{url op="downloadFile" path=$submission->getId()|to_array:$suppFile->getFileId():$suppFile->getRevision()}" class="file">{$suppFile->getFileName()|escape}</a>&nbsp;&nbsp;
				{$suppFile->getDateModified()|date_format:$dateFormatShort}
				{elseif $suppFile->getRemoteURL() != ''}<a href="{$suppFile->getRemoteURL()|escape}" target="_blank">{$suppFile->getRemoteURL()|truncate:20:"..."|escape}</a>{/if}
				&nbsp;&nbsp;
				<div class="form-group">
					<label for="show">{translate key="editor.article.showSuppFile"}</label>
					<input type="checkbox" name="show" id="show" class="form-control" value="1"{if $suppFile->getShowReviewers()==1} checked="checked"{/if}/>
					<input type="submit" name="submit" value="{translate key="common.record"}" class="btn btn-primary" />
				</div>
			</form>
		</div>
	</div>
	{foreachelse}
	<div class="row" >

		<div class="col-md-3 ">
			<span class="inline">
				<strong>
					{translate key="article.suppFilesAbbrev"}
				</strong>
			</span>
		</div>
		<div class="col-md-6" >
			{translate key="common.none"}
		</div>
	</div>
	{/foreach}


	<div class="separator"></div>
</div>

<div id="peerReview">

	<h3>{translate key="submission.peerReview"}</h3>

	<h4>{translate key="submission.round" round=$round}
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="{url op="selectReviewer" path=$submission->getId()}" class="btn btn-success">{translate key="editor.article.selectReviewer"}</a>&nbsp;&nbsp;
		<a href="{url op="submissionRegrets" path=$submission->getId()}" class="btn btn-warning">{translate|escape key="sectionEditor.regrets.link"}</a>
	</h4>
	{assign var="start" value="A"|ord}
	{foreach from=$reviewAssignments item=reviewAssignment key=reviewKey}
	{assign var="reviewId" value=$reviewAssignment->getId()}

	{if not $reviewAssignment->getCancelled() and not $reviewAssignment->getDeclined()}
	{assign var="reviewIndex" value=$reviewIndexes[$reviewId]}
	<div class="separator"></div>

	<hr>
	
		<div class="row">
			<div class="col-md-2"> 
			<h4>	{translate key="user.role.reviewer"} {$reviewIndex+$start|chr}
</h4>
			</div>

			<div class="col-md-3" >
			<h4>	{$reviewAssignment->getReviewerFullName()|escape} </h4>
			</div>
<div class="col-md-3 form-group" >
		{if not $reviewAssignment->getDateNotified()}
		<a href="{url op="clearReview" path=$submission->getId()|to_array:$reviewAssignment->getId()}" class="btn btn-danger">{translate key="editor.article.clearReview"}</a>
		{elseif $reviewAssignment->getDeclined() or not $reviewAssignment->getDateCompleted()}
		<a href="{url op="cancelReview" articleId=$submission->getId() reviewId=$reviewAssignment->getId()}" class="btn btn-danger">{translate key="editor.article.cancelReview"}</a>
		{/if}
		</div>
			</div>
	
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
	{translate key="submission.reviewForm"}
	</strong>
		</div>
		<div class="col-md-9" >
	{if $reviewAssignment->getReviewFormId()}
	{assign var="reviewFormId" value=$reviewAssignment->getReviewFormId()}
	{$reviewFormTitles[$reviewFormId]}
	{else}
	{translate key="manager.reviewForms.noneChosen"}
	{/if}
	{if !$reviewAssignment->getDateCompleted()}
	&nbsp;&nbsp;&nbsp;&nbsp;<a class="action" href="{url op="selectReviewForm" path=$submission->getId()|to_array:$reviewAssignment->getId()}"{if $reviewFormResponses[$reviewId]} onclick="return confirm('{translate|escape:"jsparam" key="editor.article.confirmChangeReviewForm"}')"{/if}>{translate key="editor.article.selectReviewForm"}</a>{if $reviewAssignment->getReviewFormId()}&nbsp;&nbsp;&nbsp;&nbsp;<a class="action" href="{url op="clearReviewForm" path=$submission->getId()|to_array:$reviewAssignment->getId()}"{if $reviewFormResponses[$reviewId]} onclick="return confirm('{translate|escape:"jsparam" key="editor.article.confirmChangeReviewForm"}')"{/if}>{translate key="editor.article.clearReviewForm"}</a>{/if}
	{/if}
	
	<table width="100%" class="table table-striped">
	<thead>
		<tr>
			<th class="inline" width="25%">{translate key="submission.request"}</th>
			<th class="inline" width="25%">{translate key="submission.underway"}</th>
			<th class="inline" width="25%">{translate key="submission.due"}</th>
			<th class="inline" width="25%">{translate key="submission.acknowledge"}</th>
		</tr>
		</thead>
		<tbody>
		<tr valign="top">
			<td>
				{url|assign:"reviewUrl" op="notifyReviewer" reviewId=$reviewAssignment->getId() articleId=$submission->getId()}
				{if $reviewAssignment->getDateNotified()}
				{$reviewAssignment->getDateNotified()|date_format:$dateFormatShort}
				{if !$reviewAssignment->getDateCompleted()}
				{icon name="mail" url=$reviewUrl}
				{/if}
				{elseif $reviewAssignment->getReviewFileId()}
				{icon name="mail" url=$reviewUrl}
				{else}
				{icon name="mail" disabled="disabled" url=$reviewUrl}
				{assign var=needsReviewFileNote value=1}
				{/if}
			</td>
			<td>
				{$reviewAssignment->getDateConfirmed()|date_format:$dateFormatShort|default:"&mdash;"}
			</td>
			<td>
				{if $reviewAssignment->getDeclined()}
				{translate key="sectionEditor.regrets"}
				{else}
				<a href="{url op="setDueDate" path=$reviewAssignment->getSubmissionId()|to_array:$reviewAssignment->getId()}">{if $reviewAssignment->getDateDue()}{$reviewAssignment->getDateDue()|date_format:$dateFormatShort}{else}&mdash;{/if}</a>
				{/if}
			</td>
			<td>
				{url|assign:"thankUrl" op="thankReviewer" reviewId=$reviewAssignment->getId() articleId=$submission->getId()}
				{if $reviewAssignment->getDateAcknowledged()}
				{$reviewAssignment->getDateAcknowledged()|date_format:$dateFormatShort}
				{elseif $reviewAssignment->getDateCompleted()}
				{icon name="mail" url=$thankUrl}
				{else}
				{icon name="mail" disabled="disabled" url=$thankUrl}
				{/if}
			</td>
		</tr>
		</tbody>
	</table>
		</div>
	</div>
	{if $reviewAssignment->getDateConfirmed() && !$reviewAssignment->getDeclined()}
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
	{translate key="reviewer.article.recommendation"}
	</strong>
		</div>
		<div class="col-md-6" >
	{if $reviewAssignment->getRecommendation() !== null && $reviewAssignment->getRecommendation() !== ''}
	{assign var="recommendation" value=$reviewAssignment->getRecommendation()}
	{translate key=$reviewerRecommendationOptions.$recommendation}
	&nbsp;&nbsp;{$reviewAssignment->getDateCompleted()|date_format:$dateFormatShort}
	{else}
	{translate key="common.none"}&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="{url op="remindReviewer" articleId=$submission->getId() reviewId=$reviewAssignment->getId()}" class="action">{translate key="reviewer.article.sendReminder"}</a>
	{if $reviewAssignment->getDateReminded()}
	&nbsp;&nbsp;{$reviewAssignment->getDateReminded()|date_format:$dateFormatShort}
	{if $reviewAssignment->getReminderWasAutomatic()}
	&nbsp;&nbsp;{translate key="reviewer.article.automatic"}
	{/if}
	{/if}
	{/if}

	{if $currentJournal->getSetting('requireReviewerCompetingInterests')}
	{translate key="reviewer.competingInterests"}

	{$reviewAssignment->getCompetingInterests()|strip_unsafe_html|nl2br|default:"&mdash;"}

	{/if}{* requireReviewerCompetingInterests *}

	{if $reviewFormResponses[$reviewId]}
	</div>
	</div>
	{translate key="submission.reviewFormResponse"}

	<a href="javascript:openComments('{url op="viewReviewFormResponse" path=$submission->getId()|to_array:$reviewAssignment->getId()}');" class="icon">{icon name="comment"}</a>


	{/if}
	{if !$reviewAssignment->getReviewFormId() || $reviewAssignment->getMostRecentPeerReviewComment()}{* Only display comments link if a comment is entered or this is a non-review form review *}
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
	{translate key="submission.review"}
	</strong>
		</div>
		<div class="col-md-6" >
	{if $reviewAssignment->getMostRecentPeerReviewComment()}
	{assign var="comment" value=$reviewAssignment->getMostRecentPeerReviewComment()}
	<a href="javascript:openComments('{url op="viewPeerReviewComments" path=$submission->getId()|to_array:$reviewAssignment->getId() anchor=$comment->getId()}');" class="icon">{icon name="comment"}</a>&nbsp;&nbsp;{$comment->getDatePosted()|date_format:$dateFormatShort}
	{else}
	<a href="javascript:openComments('{url op="viewPeerReviewComments" path=$submission->getId()|to_array:$reviewAssignment->getId()}');" class="icon">{icon name="comment"}</a>&nbsp;&nbsp;{translate key="submission.comments.noComments"}
	{/if}

	</div>
	</div>
	{/if}
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
	{translate key="reviewer.article.uploadedFile"}
	</strong>
		</div>
		<div class="col-md-6" >
	<table width="100%" class="table table-striped">
		{foreach from=$reviewAssignment->getReviewerFileRevisions() item=reviewerFile key=key}
		<tr valign="top">
			<td valign="middle">
				<form id="authorView{$reviewAssignment->getId()}" method="post" action="{url op="makeReviewerFileViewable"}">
					<a href="{url op="downloadFile" path=$submission->getId()|to_array:$reviewerFile->getFileId():$reviewerFile->getRevision()}" class="file">{$reviewerFile->getFileName()|escape}</a>&nbsp;&nbsp;{$reviewerFile->getDateModified()|date_format:$dateFormatShort}
					<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}" />
					<input type="hidden" name="articleId" value="{$submission->getId()}" />
					<input type="hidden" name="fileId" value="{$reviewerFile->getFileId()}" />
					<input type="hidden" name="revision" value="{$reviewerFile->getRevision()}" />
					{translate key="editor.article.showAuthor"} <input type="checkbox" name="viewable" value="1"{if $reviewerFile->getViewable()} checked="checked"{/if} />
					<input type="submit" value="{translate key="common.record"}" class="button" />
				</form>


				{foreachelse}
				<tr valign="top">
					<td>{translate key="common.none"}</td>
				</tr>
				{/foreach}
			</table>
				</div>
	</div>

			{/if}

			{if (($reviewAssignment->getRecommendation() === null || $reviewAssignment->getRecommendation() === '') || !$reviewAssignment->getDateConfirmed()) && $reviewAssignment->getDateNotified() && !$reviewAssignment->getDeclined()}
	<div class="row" >

		<div class="col-md-3 ">
<span class="inline">
			<strong>
			{translate key="reviewer.article.editorToEnter"}
	</strong>
	</span>
		</div>
		<div class="col-md-9" >
			{if !$reviewAssignment->getDateConfirmed()}
			<a href="{url op="confirmReviewForReviewer" path=$submission->getId()|to_array:$reviewAssignment->getId() accept=1}" class="btn btn-success btn-xs">{translate key="reviewer.article.canDoReview"}</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="{url op="confirmReviewForReviewer" path=$submission->getId()|to_array:$reviewAssignment->getId() accept=0}" class="btn btn-warning btn-xs">{translate key="reviewer.article.cannotDoReview"}</a><br />
			{/if}
			{translate key="editor.article.uploadReviewForReviewer"}
			<form method="post" action="{url op="uploadReviewForReviewer"}" enctype="multipart/form-data" class="form-inline">
				
				<input type="hidden" name="articleId" value="{$submission->getId()}" />
				<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}"/>
				<div class="form-group">
				<input type="file" name="upload" class="form-control" />
				<input type="submit" name="submit" value="{translate key="common.upload"}" class="btn btn-primary" />
				</div>
			</form>
			{if $reviewAssignment->getDateConfirmed() && !$reviewAssignment->getDeclined()}
			<a class="action" href="{url op="enterReviewerRecommendation" articleId=$submission->getId() reviewId=$reviewAssignment->getId()}">{translate key="editor.article.recommendation"}</a>
			{/if}
	</div>
	</div>

			{/if}

			{if $reviewAssignment->getDateNotified() && !$reviewAssignment->getDeclined() && $rateReviewerOnQuality}
	<div class="row" >

		<div class="col-md-3 ">

			<strong>
			{translate key="editor.article.rateReviewer"}
	</strong>
		</div>
		<div class="col-md-6" >
			<form method="post" action="{url op="rateReviewer"}" class="form-horizontal">
				<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}" />
				<input type="hidden" name="articleId" value="{$submission->getId()}" />
				<select name="quality" size="1" class="form-control">
					{html_options_translate options=$reviewerRatingOptions selected=$reviewAssignment->getQuality()}
				</select>&nbsp;&nbsp;
				<input type="submit" value="{translate key="common.record"}" class="btn btn-primary" />
				{if $reviewAssignment->getDateRated()}
				&nbsp;&nbsp;{$reviewAssignment->getDateRated()|date_format:$dateFormatShort}
				{/if}
			</form>
			</div>
			</div>

			{/if}
			{if $needsReviewFileNote}

	<div class="row" >

		<div class="col-md-3 ">

			<strong>
			{translate key="submission.review.mustUploadFileForReview"}
			</strong>
				</div>
	</div>

			{/if}


			{/if}
			{/foreach}
		</div>

