'use strict'; // eslint-disable-line

/*
    Get details on an Object.
*/

/**
 * getObjMethods - get all methods of an Object
 * @param {object} obj: object to view/test
 * @return {array}
 */
function getObjMethods(obj) {
    let result = [];

    for (let name in obj) {
        try {
            if (typeof obj[name] == 'function') {
                result.push(`${name}: ${obj[name].toString()}`);
            }
        } catch (err) {
            result.push(`${name}: inaccessible`);
        }
    }
    return result;
}

/**
 * getObjProperties - get all properties of an Object
 * @param {object} obj: object to view/test
 * @return {array}
 */
function getObjProperties(obj) {
    let result = [];

    for (let propName in obj) {
        result.push(obj[propName]);
    }

    return result;
}
