'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Images', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      path: {
        type: Sequelize.STRING
      },
      image_name: {
        type: Sequelize.STRING
      },
      laptop_id: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });

    // fk laptop
    await queryInterface.addConstraint('images', {
      fields: ['laptop_id'],
      type: 'foreign key',
      name: 'images_fkey__laptops',
      references : {
        table: 'laptops', 
        field: 'id'
      },
      onDelete: 'cascade',
      onUpdate: 'cascade'
  })
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Images');
  }
};