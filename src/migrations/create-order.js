'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('orders', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false,

      },
      shipping_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      payment_id: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      status: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      total_product: {
        type: Sequelize.DOUBLE,
        allowNull: false,
      },
      total: {
        type: Sequelize.DOUBLE,
        allowNull: false,
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

    await queryInterface.addConstraint('orders', {
        fields: ['user_id'],
        type: 'foreign key',
        name: 'orders_fkey_user11',
        references : {
          table: 'users', 
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
    })

    await queryInterface.addConstraint('orders', {
        fields: ['shipping_id'],
        type: 'foreign key',
        name: 'orders_fkey_shipping11',
        references : {
          table: 'shippings', 
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
    })

    await queryInterface.addConstraint('orders', {
        fields: ['payment_id'],
        type: 'foreign key',
        name: 'orders_fkey_payments111',
        references : {
          table: 'payments', 
          field: 'id'
        },
        onDelete: 'cascade',
        onUpdate: 'cascade'
    })

  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('orders');
  }
};