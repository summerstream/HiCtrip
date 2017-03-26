import React,{Component} from 'react'
import{
    View,
    StyleSheet,
    TextInput,
    Image,
    Button,
    Alert,
    NativeModules,
    TouchableHighlight,
    NativeEventEmitter
}from 'react-native'

const {
    IFlyRecognizerCallBack
} = NativeModules;

const IFlyRecognizerCallBackEmitter = new NativeEventEmitter(NativeModules.IFlyRecognizerCallBack);


export default class InputBar extends Component{
    constructor(props){
        super(props);
       
        this._recognizer = NativeModules.IFlyRecognizer;
        this.subscription = undefined;

        this._recognizer.create();
        // IFlyRecognizerCallBackEmitter.create();

        this.onPressIn = this.onPressIn.bind(this);
        this.onPressOut = this.onPressOut.bind(this);
    }
    componentWillUnmount(){
        if(this.subscription){
            this.subscription.remove();
            this.subscription = null;
        }
    }
    // get recognizer(){
    //     return this._recognizer;
    // }
    onInput(){
        if(this.subscription){
            this.subscription.remove();
            this.subscription = null;
        }
    }
    onPressIn(){
        this._recognizer.begin();
        // IFlyRecognizerCallBackEmitter.begin();
        if(this.subscription){
            this.subscription.remove();
            this.subscription = null;
        }
        this.subscription = IFlyRecognizerCallBackEmitter.addListener('resultReceived',this.renderMessage.bind(this));

    }
    onPressOut(){
        this._recognizer.stop();
        // IFlyRecognizerCallBackEmitter.stop();
    }
    renderMessage(data){
        Alert.alert(data.message);
        // console.log(data.message);
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