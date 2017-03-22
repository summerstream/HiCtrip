import React , {Component} from 'react'
import {
    View,
    Text,
    StyleSheet
}from 'react-native'

export default class Welcome extends Component{
    render(){
        return (
            <View style={styles.container}>
                <Text style={styles.title} >
                    你可以这样问我:
                </Text>
                <View style={styles.list} >
                    <Text style={styles.item} >
                        "三亚租车"
                    </Text>
                    <Text style={styles.item} >
                        "三亚下周酒店"
                    </Text>
                    <Text style={styles.item} >
                        "上海到三亚机票"
                    </Text>
                </View>
            </View>
        );
    }
}

const styles=StyleSheet.create({
    container:{
        padding:30,
        paddingTop:60,
        paddingLeft:0,
        flexDirection:'column',
        justifyContent:'flex-start',
        alignItems:'flex-start'
    },
    title:{
        flex:1,
        paddingLeft:0,
        fontSize:40,
        color:'white',
        textAlign:'left',
        
    },
    list:{
        flex:6,
        justifyContent:'flex-start',
        paddingLeft:0
    },
    item:{
        // flex:1,
        padding:5,
        paddingLeft:0,
        fontSize:18,
        color:'#dddddda0'
    }
});