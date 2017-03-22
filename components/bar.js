import React ,{Component} from 'react'
import {
    StyleSheet,
    View
}from 'react-native'

export default class Bar extends Component{
    rendor(){   
        return (
            <View style={styles.container}>
                <View></View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container:{
        flex:1,
        flexDirection:'row',
        justifyContent:space-between
    },
    account:{

    }
})