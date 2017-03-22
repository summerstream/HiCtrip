import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import InputBar from '../components/input-bar.js';
import Welcome from '../components/welcome';

export default class App extends Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.content}>
          <Welcome />
        </View>
        <InputBar style={styles.input} />
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
    flex:3,
    marginTop: 40,
  },
  input: {
    
  },
});

