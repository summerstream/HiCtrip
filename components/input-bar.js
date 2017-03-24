import React,{Component} from 'react'
import{
    View,
    StyleSheet,
    TextInput,
    Image,
    Button,
    Alert,
    NativeModules
}from 'react-native'

export default class InputBar extends Component{
    onInput(){

    }
    onPress(){
        // Alert.alert('onPress');
        var recognizer = NativeModules.IFlyRecognizer;
        // Alert.alert(recognizer == undefined ? '1':'0');
        // recognizer.addEvent('name','haha,address');
        recognizer.create();
        recognizer.begin();
    }
    render(){
        return (
            <View style={styles.container}>
                <TextInput 
                    style={styles.input}
                    onChange={this.onInput} 
                    value={'我想去三亚租车玩'}
                />
                <Button 
                    onPress={this.onPress}
                    title='button'
                />
                <Image 
                    style={styles.icon}
                    source={require('../img/speaker-512.png')}
                 />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container:{
        flexDirection:'row',
        justifyContent:'space-between',
        backgroundColor:'#1560bb'
    },
    input:{
        flex:100,
        height:50,
        padding:5,
        paddingLeft:20,
        borderColor:'grey'
    },
    icon:{
        width:70,
        height:70,
        marginTop:-20
    }
});