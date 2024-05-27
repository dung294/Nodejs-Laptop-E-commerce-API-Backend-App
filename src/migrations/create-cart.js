'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('carts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false

      },
      laptop_id: {
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

    await queryInterface.addConstraint('carts', {
      fields: ['laptop_id'],
      type: 'foreign key',
      name: 'carts_fkey__laptops',
      references : {
        table: 'laptops', 
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    })

    await queryInterface.addConstraint('carts', {
      fields: ['user_id'],
      type: 'foreign key',
      name: 'carts_fkey__users',
      references : {
        table: 'users', 
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
    })
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('carts');
  }
};