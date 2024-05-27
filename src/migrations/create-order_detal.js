'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('orderdetails', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      laptop_id: {
        type: Sequelize.INTEGER,
        allowNull: false,

      },
      order_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      price: {
        type: Sequelize.INTEGER,
        allowNull: false

      },
      qty: {
        type: Sequelize.INTEGER,
        allowNull: false

      },
      
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP')
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      }
    });

    await queryInterface.addConstraint('orderdetails', {
        fields: ['order_id'],
        type: 'foreign key',
        name: 'orderdetails_fkey_orders',
        references : {
          table: 'orders', 
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
    })

    await queryInterface.addConstraint('orderdetails', {
        fields: ['laptop_id'],
        type: 'foreign key',
        name: 'orderdetails_fkey_laptop',
        references : {
          table: 'laptops', 
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
    })
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('order_details');
    
  }
};