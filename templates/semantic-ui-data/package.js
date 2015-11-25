Package.describe({
  name: '<%= info.pkgData.name %>',
  version: '<%= info.pkgData.version %>',
  summary: 'Data package for Semantic UI Meteor',
  git: '<%= info.pkgData.git %>',
  documentation: 'README.md'
});

var definitions = <%= definitions %>;
var themes = <%= themes %>;
var sites = <%= sites %>;

Package.onUse(function(api) {
  api.versionsFrom('1.2.0.2');
  api.addFiles('semantic-ui-data.js', 'server');
  api.export(['semanticUiDataPackage']);

  api.addAssets(definitions, 'server');
  api.addAssets(themes, 'server');
  api.addAssets(sites, 'server');
  api.addAssets('<%= info.semantic.dest.themeLessFileRelativePath %>', 'server');
  api.addAssets('<%= info.semantic.dest.semanticLessFileRelativePath %>', 'server');
  api.addAssets('<%= info.semantic.dest.themeConfigFileRelativePath %>', 'server');
});