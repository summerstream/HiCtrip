import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import InputBar from '../components/input-bar.js';

export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          <Text>Hi Ctrip!</Text>
        </View>
        <InputBar />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection:'column',
    justifyContent: 'space-between',
    alignItems: 'center',
    backgroundColor: '#2065c2',
  },
  content: {
    marginTop: 40,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

