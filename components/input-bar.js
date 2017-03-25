import React,{Component} from 'react'
import{
    View,
    StyleSheet,
    TextInput,
    Image,
    Button,
    Alert,
    NativeModules,
    TouchableHighlight
}from 'react-native'

export default class InputBar extends Component{
    constructor(props){
        super(props);
       
        this._recognizer = NativeModules.IFlyRecognizer;
        this._recognizer.create();
        this.onPressIn = this.onPressIn.bind(this);
        this.onPressOut = this.onPressOut.bind(this);
    }
    get recognizer(){
        return this._recognizer;
    }
    onInput(){

    }
    onPressIn(){
        this._recognizer.begin();
    }
    onPressOut(){
        this._recognizer.stop();
    }
    render(){
        return (
            <View style={styles.container}>
                <TextInput 
                    style={styles.input}
                    onChange={this.onInput} 
                    value={'我想去三亚租车玩'}
                />
                <TouchableHighlight style={styles.icon}
                    // onPress={this.onPress}
                    onPressIn={this.onPressIn}
                    onPressOut={this.onPressOut}
                    title='button'
                >
                   
                        <Image 
                            style={styles.icon}
                            source={require('../img/speaker-512.png')}
                        />
                    
                </TouchableHighlight>
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
        marginTop:0
    }
});