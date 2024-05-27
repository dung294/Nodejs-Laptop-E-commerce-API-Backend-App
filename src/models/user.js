'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      User.belongsTo(models.Role, { foreignKey: 'role_id', targetKey: 'id'})
      User.hasMany(models.Cart, { foreignKey: 'user_id', targetKey: 'id'})
      User.belongsToMany(models.UserInforShipping, {  through: 'UserInforShippingInforShipping',  foreignKey: 'user_id' })
    }
  }
  User.init({
    name: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,
    role_id: {
      type: DataTypes.INTEGER, 
    },
    type_account : DataTypes.STRING,
    provider_id: DataTypes.STRING, 
  }, {
    sequelize,
    modelName: 'User',
  });
  return User;
};