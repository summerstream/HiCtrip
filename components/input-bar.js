import React,{Component} from 'react'
import{
    View,
    StyleSheet,
    TextInput,
    Image
}from 'react-native'

export default class InputBar extends Component{
    onInput(){

    }
    render(){
        return (
            <View style={styles.container}>
                <TextInput 
                    style={styles.input}
                    onChange={this.onInput} />
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
        borderColor:'grey'
    },
    icon:{
        width:70,
        height:70,
        marginTop:-20
    }
});