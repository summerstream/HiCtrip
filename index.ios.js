import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import {
  AppRegistry
} from 'react-native';
import App from './containers/app';
import reducer from './reducers';

const store = createStore(reducer);

export default class HiCtrip extends Component {
  render() {
    return (
      <Provider store={store}>
        <App />
      </Provider>
    );
  }
}

AppRegistry.registerComponent('HiCtrip', () => HiCtrip);
