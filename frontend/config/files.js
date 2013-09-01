/* Exports an object that defines
 *  all of the paths & globs that the project
 *  is concerned with.
 *
 * The "configure" task will require this file and
 *  then re-initialize the grunt config such that
 *  directives like <config:files.js.app> will work
 *  regardless of the point you're at in the build
 *  lifecycle.
 *
 * To see the default definitions for all of Lineman's file paths and globs, look at:
 * https://github.com/testdouble/lineman/blob/master/config/files.coffee
 */

module.exports = require(process.env['LINEMAN_MAIN']).config.extend('files', {
  //Override file patterns here
  js: {
    vendor: [
      "vendor/js/jquery-1.9.1.js",
      "vendor/js/bootstrap.js",
      "vendor/js/handlebars-1.0.0.js",
      "vendor/js/ember-1.0.0-rc.8.js",
      "vendor/js/ember-data.js",
      "vendor/js/**/*.js"
    ],
    app: [
      "app/js/**/*.js"
    ]
  },
  coffee: {
    app: [
      "app/js/application.coffee",
      "app/js/**/*.coffee"
    ]

  }
});
