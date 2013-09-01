<div class='navbar navbar-inverse navbar-fixed-top'>
  <div class='navbar-inner'>
    <div class='container'>
      <div class='nav-collapse collapse'>
        <ul class='nav'>
          <li>{{#linkTo 'index'}}Home{{/linkTo}}</li>
          <li>{{#linkTo 'users'}}Users{{/linkTo}}</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class='container' id='main'>
  <div class='content'>
    <div class='row'>
      <div class='span12'>
        <div class='page-header'></div>
          <h1>{{appName}}</h1>
          <h2>{{title}}</h2>
          {{outlet}}
      </div>
    </div>
  </div>
</div>