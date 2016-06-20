{**
	* templates/author/submission/summary.tpl
	*
	* Copyright (c) 2013-2016 Simon Fraser University Library
	* Copyright (c) 2003-2016 John Willinsky
	* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
	*
	* Subtemplate defining the author's submission summary table.
	*
	*}
	<div id="submission">
		<h3>{translate key="article.submission"}</h3>

		<div class="row" >

			<div class="col-md-3 ">
				<h5>
					<strong>		
						{translate key="article.authors"}
					</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

					{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$submission->getAuthorEmails() subject=$submission->getLocalizedTitle() articleId=$submission->getId()}
					{$submission->getAuthorString()|escape} {icon name="mail" url=$url}
				</h5>
			</div>
</div>
<div class="row">
					<div class="col-md-3 ">
				<h5>
					<strong>		
	
			{translate key="article.title"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{$submission->getLocalizedTitle()|strip_unsafe_html}
				</h5>
			</div>
</div>
<div class="row">
		<div class="col-md-3 ">
				<h5>
					<strong>		
	
			{translate key="section.section"}
				</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{$submission->getSectionTitle()|escape}

				</h5>
			</div>
</div>
<div class="row">
			
					<div class="col-md-3 ">
				<h5>
					<strong>		
	
			{translate key="user.role.editor"}
					</strong>
				</h5>
			</div>
			<div class="col-md-6" >
				<h5>

			{assign var=editAssignments value=$submission->getEditAssignments()}
			{foreach from=$editAssignments item=editAssignment}
			{assign var=emailString value=$editAssignment->getEditorFullName()|concat:" <":$editAssignment->getEditorEmail():">"}
			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle()|strip_tags articleId=$submission->getId()}
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
		</h5>
			</div>
</div>
		</div>

