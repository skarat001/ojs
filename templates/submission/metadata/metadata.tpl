{**
 * templates/submission/metadata/metadata.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the submission metadata table. Non-form implementation.
 *}
<div id="metadata">
<h3>{translate key="submission.metadata"}</h3>

{if $canEditMetadata}
	<p><a href="{url op="viewMetadata" path=$submission->getId()}" class="btn btn-warning">{translate key="submission.editMetadata"}</a></p>
	{call_hook name="Templates::Submission::Metadata::Metadata::AdditionalEditItems"}
{/if}

<div id="authors">

<h4>{translate key="article.authors"}</h4>
	

	{foreach name=authors from=$submission->getAuthors() item=author}
	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="user.name"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
			{assign var=emailString value=$author->getFullName()|concat:" <":$author->getEmail():">"}
			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle()|strip_tags articleId=$submission->getId()}
			{$author->getFullName()|escape} {icon name="mail" url=$url}
		
	{if $author->getData('orcid')}
		
		{translate key="user.orcid"}

		<a href="{$author->getData('orcid')|escape}" target="_blank">{$author->getData('orcid')|escape}</a>
<br/>
	{/if}
	{if $author->getUrl()}
		
		{translate key="user.url"}

		<a href="{$author->getUrl()|escape:"quotes"}">{$author->getUrl()|escape}</a>
<br/>
	{/if}
		</strong>
				</h5>
			</div>
</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="user.affiliation"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	{$author->getLocalizedAffiliation()|escape|nl2br|default:"&mdash;"}</td>
		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="common.country"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	{$author->getCountryLocalized()|escape|default:"&mdash;"}


	{if $currentJournal->getSetting('requireAuthorCompetingInterests')}
		
				{url|assign:"competingInterestGuidelinesUrl" page="information" op="competingInterestGuidelines"}
				{translate key="author.competingInterests" competingInterestGuidelinesUrl=$competingInterestGuidelinesUrl}
			
			{$author->getLocalizedCompetingInterests()|strip_unsafe_html|nl2br|default:"&mdash;"}

	{/if}
			</strong>
				</h5>
			</div>

</div>

<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="user.biography"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	{$author->getLocalizedBiography()|strip_unsafe_html|nl2br|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>

<div class="row" >

			<div class="col-md-5 ">
				<h5>
	{if $author->getPrimaryContact()}
		
		{translate key="author.submit.selectPrincipalContact"}

	{/if}

	{if !$smarty.foreach.authors.last}
		

	{/if}
	</h5>
			</div>
			</div>
	{/foreach}


</div>

<div id="titleAndAbstract">
<h4>{translate key="submission.titleAndAbstract"}</h4>
<div class="row" >

			<div class="col-md-3 ">
				<h5>

		{translate key="article.title"}
		</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedTitle()|strip_unsafe_html|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.abstract"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
</div>

<div id="indexing">
<h4>{translate key="submission.indexing"}</h4>
	

	{if $currentJournal->getSetting('metaDiscipline')}
		<div class="row" >

			<div class="col-md-3 ">
				<h5>

		{translate key="article.discipline"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedDiscipline()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
	{/if}
	{if $currentJournal->getSetting('metaSubjectClass')}
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.subjectClassification"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedSubjectClass()|escape|default:"&mdash;"}

		</strong>
				</h5>
			</div>

</div>
	{/if}
	{if $currentJournal->getSetting('metaSubject')}
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.subject"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedSubject()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>

	{/if}
	{if $currentJournal->getSetting('metaCoverage')}
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.coverageGeo"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedCoverageGeo()|escape|default:"&mdash;"
		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.coverageChron"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedCoverageChron()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.coverageSample"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedCoverageSample()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
	{/if}
	{if $currentJournal->getSetting('metaType')}
		<div class="row" >

			<div class="col-md-3 ">
				<h5>
		{translate key="article.type"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
		{$submission->getLocalizedType()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
	{/if}
	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="article.language"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	{$submission->getLanguage()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
</div>

<div id="supportingAgencies">
<h4>{translate key="submission.supportingAgencies"}</h4>
	
<div class="row" >

			<div class="col-md-3 ">
				<h5>
{translate key="submission.agencies"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
{$submission->getLocalizedSponsor()|escape|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
</div>

{call_hook name="Templates::Submission::Metadata::Metadata::AdditionalMetadata"}

{if $currentJournal->getSetting('metaCitations')}
	<div id="citations">
	<h4>{translate key="submission.citations"}</h4>

	<div class="row" >

			<div class="col-md-3 ">
				<h5>
	{translate key="submission.citations"}
</h5>
			</div>
			<div class="col-md-6" >
				<h5>
					<strong>
	{$submission->getCitations()|strip_unsafe_html|nl2br|default:"&mdash;"}
		</strong>
				</h5>
			</div>

</div>
	</div>
{/if}

</div><!-- metadata -->

