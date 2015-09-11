# Docs

## UJS helpers

* ### registerComponent
  ```js
  registerComponent(String componentName, class|function component)
  ```

  Register component so it's globally accessible.

  ##### example:

  ```js
  import MyComponent from 'my-component';

  registerComponent('MyComponentName', MyComponent);
  ```

  **note:** Registered components are accessible in globally exposed `ReactRailsUJS` under `reactComponents` property.

* ### getComponent

  ```js
  getComponent(String componentName)
  ```

  Shortcut for accessing registered component.

  ##### example:

  ```js
  getComponent('MyComponentName');
  ```

* ### createComponent

  ```js
  createComponent(String componentName[, Object props])
  ```

  Wrapper over React.createElement that creates ready to render component with props.

  ##### example:

  ```js
  createComponent('MyComponentName', {foo: 'bar'});
  ```

* ### renderComponent

  ```js
  renderComponent(String componentName, Object props, DOMElement container)
  ```

  Wrapper over `React.render` and `React.createElement`. Renders component with given props into specified DOM element.

  ##### example:

  ```js
  var element = document.getElementById('my-element');
  renderComponent('MyComponentName', {foo: 'bar'}, element);
  ```

## Rails helpers

* ### react_component

  ```ruby
  react_component(String component_name[, Object props])
  ```

  Creates DOM node with props as data attributes in rendered view so ReactRailsUJS can grab it and mount proper  component.

  ##### example:

  ```ruby
  <%= react_component('MyComponentName', MySerializer.new(my_data)) %>
  ```

  **note:** Props Object will parsed to JSON. Be careful when passing rails models there - all its data accessible after `.to_json` will be exposed as data-attributes. We  recommend using serializers to control it.
