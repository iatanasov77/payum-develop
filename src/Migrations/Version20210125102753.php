<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210125102753 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE TEST_Products (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(64) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE TEST_Products_Taxons (product_id INT NOT NULL, taxon_id INT NOT NULL, INDEX IDX_6258FE5A4584665A (product_id), INDEX IDX_6258FE5ADE13F470 (taxon_id), PRIMARY KEY(product_id, taxon_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_info (id INT AUTO_INCREMENT NOT NULL, user_id INT DEFAULT NULL, api_token VARCHAR(255) NOT NULL, country VARCHAR(255) NOT NULL, birthday DATETIME NOT NULL, mobile VARCHAR(255) NOT NULL, website VARCHAR(255) NOT NULL, occupation VARCHAR(255) NOT NULL, UNIQUE INDEX UNIQ_B1087D9EA76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE TEST_Products_Taxons ADD CONSTRAINT FK_6258FE5A4584665A FOREIGN KEY (product_id) REFERENCES TEST_Products (id)');
        $this->addSql('ALTER TABLE TEST_Products_Taxons ADD CONSTRAINT FK_6258FE5ADE13F470 FOREIGN KEY (taxon_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE user_info ADD CONSTRAINT FK_B1087D9EA76ED395 FOREIGN KEY (user_id) REFERENCES VSUM_Users (id)');
        $this->addSql('DROP TABLE VSCMS_PageCategories_BACKUP');
        $this->addSql('DROP TABLE VSUM_UserGroups');
        $this->addSql('DROP TABLE VSUM_UsersActivities');
        $this->addSql('DROP TABLE VSUM_UsersNotifications');
        $this->addSql('DROP TABLE VSUM_Users_Groups');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD maintenance_page_id  INT DEFAULT NULL, DROP maintenance_page_id, CHANGE maintenanceMode maintenanceMode TINYINT(1) NOT NULL, CHANGE language language VARCHAR(255) DEFAULT NULL, CHANGE theme theme VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FD507FAB6A FOREIGN KEY (maintenance_page_id ) REFERENCES VSCMS_Pages (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD CONSTRAINT FK_4A491FDF6BD1646 FOREIGN KEY (site_id) REFERENCES VSAPP_SiteSettings (id)');
        $this->addSql('CREATE INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings (maintenance_page_id )');
        $this->addSql('CREATE INDEX IDX_4A491FDF6BD1646 ON VSAPP_Settings (site_id)');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings CHANGE settings_id settings_id INT DEFAULT NULL, CHANGE site_id site_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings ADD CONSTRAINT FK_13818E8F59949888 FOREIGN KEY (settings_id) REFERENCES VSAPP_Settings (id)');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings ADD CONSTRAINT FK_13818E8FF6BD1646 FOREIGN KEY (site_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings RENAME INDEX page_id TO IDX_13818E8F59949888');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings RENAME INDEX taxon_id TO IDX_13818E8FF6BD1646');
        $this->addSql('ALTER TABLE VSAPP_TaxonTranslations CHANGE translatable_id translatable_id INT NOT NULL, CHANGE locale locale VARCHAR(255) NOT NULL, CHANGE slug slug VARCHAR(255) NOT NULL, CHANGE name name VARCHAR(255) NOT NULL, CHANGE description description LONGTEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSAPP_TaxonTranslations ADD CONSTRAINT FK_AFE16CB02C2AC5D3 FOREIGN KEY (translatable_id) REFERENCES VSAPP_Taxons (id) ON DELETE CASCADE');
        $this->addSql('CREATE INDEX IDX_AFE16CB02C2AC5D3 ON VSAPP_TaxonTranslations (translatable_id)');
        $this->addSql('CREATE UNIQUE INDEX slug_uidx ON VSAPP_TaxonTranslations (locale, slug)');
        $this->addSql('CREATE UNIQUE INDEX VSAPP_TaxonTranslations_uniq_trans ON VSAPP_TaxonTranslations (translatable_id, locale)');
        $this->addSql('ALTER TABLE VSAPP_Taxonomy CHANGE root_taxon_id root_taxon_id INT DEFAULT NULL, CHANGE name name VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE VSAPP_Taxonomy ADD CONSTRAINT FK_1CF38905A54E9E96 FOREIGN KEY (root_taxon_id) REFERENCES VSAPP_Taxons (id) ON DELETE CASCADE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_1CF38905A54E9E96 ON VSAPP_Taxonomy (root_taxon_id)');
        $this->addSql('ALTER TABLE VSAPP_Taxons CHANGE code code VARCHAR(255) NOT NULL, CHANGE position position INT NOT NULL');
        $this->addSql('ALTER TABLE VSAPP_Taxons ADD CONSTRAINT FK_2661B30BA977936C FOREIGN KEY (tree_root) REFERENCES VSAPP_Taxons (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE VSAPP_Taxons ADD CONSTRAINT FK_2661B30B727ACA70 FOREIGN KEY (parent_id) REFERENCES VSAPP_Taxons (id) ON DELETE CASCADE');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_2661B30B77153098 ON VSAPP_Taxons (code)');
        $this->addSql('CREATE INDEX IDX_2661B30BA977936C ON VSAPP_Taxons (tree_root)');
        $this->addSql('CREATE INDEX IDX_2661B30B727ACA70 ON VSAPP_Taxons (parent_id)');
        $this->addSql('ALTER TABLE VSAPP_Translations DROP object_id');
        $this->addSql('CREATE INDEX translations_lookup_idx ON VSAPP_Translations (locale, object_class, foreign_key)');
        $this->addSql('CREATE UNIQUE INDEX lookup_unique_idx ON VSAPP_Translations (locale, object_class, field, foreign_key)');
        $this->addSql('ALTER TABLE VSCMS_PageCategories CHANGE page_id page_id INT DEFAULT NULL, CHANGE taxon_id taxon_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCMS_PageCategories ADD CONSTRAINT FK_98A43648C4663E4 FOREIGN KEY (page_id) REFERENCES VSCMS_Pages (id)');
        $this->addSql('ALTER TABLE VSCMS_PageCategories ADD CONSTRAINT FK_98A43648DE13F470 FOREIGN KEY (taxon_id) REFERENCES VSAPP_Taxons (id)');
        $this->addSql('ALTER TABLE VSCMS_PageCategories RENAME INDEX page_id TO IDX_98A43648C4663E4');
        $this->addSql('ALTER TABLE VSCMS_PageCategories RENAME INDEX taxon_id TO IDX_98A43648DE13F470');
        $this->addSql('ALTER TABLE VSCMS_Pages CHANGE category_id category_id INT DEFAULT NULL, CHANGE slug slug VARCHAR(255) NOT NULL, CHANGE title title VARCHAR(255) NOT NULL, CHANGE published published TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE VSCMS_Pages ADD CONSTRAINT FK_345A075A12469DE2 FOREIGN KEY (category_id) REFERENCES VSCMS_PageCategories (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_345A075A989D9B62 ON VSCMS_Pages (slug)');
        $this->addSql('CREATE INDEX IDX_345A075A12469DE2 ON VSCMS_Pages (category_id)');
        $this->addSql('ALTER TABLE VSUM_Users DROP preferedLocale, DROP username_canonical, DROP email_canonical, DROP subscriptionId, DROP user_info_id, CHANGE username username VARCHAR(255) NOT NULL, CHANGE email email VARCHAR(255) NOT NULL, CHANGE salt salt VARCHAR(255) NOT NULL, CHANGE last_login last_login DATETIME NOT NULL, CHANGE confirmation_token confirmation_token VARCHAR(255) NOT NULL, CHANGE prefered_locale prefered_locale VARCHAR(255) NOT NULL, CHANGE first_name first_name VARCHAR(255) NOT NULL, CHANGE last_name last_name VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE VSUM_Users ADD CONSTRAINT FK_CAFDCD035D8BC1F8 FOREIGN KEY (info_id) REFERENCES user_info (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_CAFDCD035D8BC1F8 ON VSUM_Users (info_id)');
        $this->addSql('DROP INDEX UNIQ_9E6E7D917BA2F5EB ON VSUM_UsersInfo');
        $this->addSql('ALTER TABLE VSUM_UsersInfo ADD api_token VARCHAR(255) NOT NULL, DROP apiToken, DROP firstName, DROP lastName, CHANGE country country VARCHAR(255) NOT NULL, CHANGE birthday birthday DATETIME NOT NULL, CHANGE mobile mobile VARCHAR(255) NOT NULL, CHANGE website website VARCHAR(255) NOT NULL, CHANGE occupation occupation VARCHAR(255) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE TEST_Products_Taxons DROP FOREIGN KEY FK_6258FE5A4584665A');
        $this->addSql('ALTER TABLE VSUM_Users DROP FOREIGN KEY FK_CAFDCD035D8BC1F8');
        $this->addSql('CREATE TABLE VSCMS_PageCategories_BACKUP (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, lft INT NOT NULL, lvl INT NOT NULL, rgt INT NOT NULL, root_id INT DEFAULT NULL, parent_id INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE VSUM_UserGroups (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(180) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, roles LONGTEXT CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci` COMMENT \'(DC2Type:array)\', UNIQUE INDEX UNIQ_D52F22C85E237E06 (name), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE VSUM_UsersActivities (id INT AUTO_INCREMENT NOT NULL, date DATETIME NOT NULL, userId INT DEFAULT NULL, activity VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE VSUM_UsersNotifications (id INT AUTO_INCREMENT NOT NULL, date DATETIME NOT NULL, userId INT DEFAULT NULL, notification VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE VSUM_Users_Groups (userId INT NOT NULL, groupId INT NOT NULL) DEFAULT CHARACTER SET utf8 COLLATE `utf8_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('DROP TABLE TEST_Products');
        $this->addSql('DROP TABLE TEST_Products_Taxons');
        $this->addSql('DROP TABLE user_info');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FD507FAB6A');
        $this->addSql('ALTER TABLE VSAPP_Settings DROP FOREIGN KEY FK_4A491FDF6BD1646');
        $this->addSql('DROP INDEX IDX_4A491FD507FAB6A ON VSAPP_Settings');
        $this->addSql('DROP INDEX IDX_4A491FDF6BD1646 ON VSAPP_Settings');
        $this->addSql('ALTER TABLE VSAPP_Settings ADD maintenance_page_id INT NOT NULL, DROP maintenance_page_id , CHANGE maintenanceMode maintenanceMode TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE language language VARCHAR(64) CHARACTER SET latin1 DEFAULT \'en\' NOT NULL COLLATE `latin1_swedish_ci`, CHANGE theme theme VARCHAR(64) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings DROP FOREIGN KEY FK_13818E8F59949888');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings DROP FOREIGN KEY FK_13818E8FF6BD1646');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings CHANGE settings_id settings_id INT NOT NULL, CHANGE site_id site_id INT NOT NULL COMMENT \'Taxon ID from taxonomy Sites\'');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings RENAME INDEX idx_13818e8f59949888 TO page_id');
        $this->addSql('ALTER TABLE VSAPP_SiteSettings RENAME INDEX idx_13818e8ff6bd1646 TO taxon_id');
        $this->addSql('ALTER TABLE VSAPP_TaxonTranslations DROP FOREIGN KEY FK_AFE16CB02C2AC5D3');
        $this->addSql('DROP INDEX IDX_AFE16CB02C2AC5D3 ON VSAPP_TaxonTranslations');
        $this->addSql('DROP INDEX slug_uidx ON VSAPP_TaxonTranslations');
        $this->addSql('DROP INDEX VSAPP_TaxonTranslations_uniq_trans ON VSAPP_TaxonTranslations');
        $this->addSql('ALTER TABLE VSAPP_TaxonTranslations CHANGE translatable_id translatable_id INT DEFAULT NULL, CHANGE name name VARCHAR(64) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE slug slug VARCHAR(64) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE description description VARCHAR(255) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE locale locale VARCHAR(6) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('ALTER TABLE VSAPP_Taxonomy DROP FOREIGN KEY FK_1CF38905A54E9E96');
        $this->addSql('DROP INDEX UNIQ_1CF38905A54E9E96 ON VSAPP_Taxonomy');
        $this->addSql('ALTER TABLE VSAPP_Taxonomy CHANGE root_taxon_id root_taxon_id INT NOT NULL, CHANGE name name VARCHAR(64) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('ALTER TABLE VSAPP_Taxons DROP FOREIGN KEY FK_2661B30BA977936C');
        $this->addSql('ALTER TABLE VSAPP_Taxons DROP FOREIGN KEY FK_2661B30B727ACA70');
        $this->addSql('DROP INDEX UNIQ_2661B30B77153098 ON VSAPP_Taxons');
        $this->addSql('DROP INDEX IDX_2661B30BA977936C ON VSAPP_Taxons');
        $this->addSql('DROP INDEX IDX_2661B30B727ACA70 ON VSAPP_Taxons');
        $this->addSql('ALTER TABLE VSAPP_Taxons CHANGE code code VARCHAR(64) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, CHANGE position position INT DEFAULT NULL');
        $this->addSql('DROP INDEX translations_lookup_idx ON VSAPP_Translations');
        $this->addSql('DROP INDEX lookup_unique_idx ON VSAPP_Translations');
        $this->addSql('ALTER TABLE VSAPP_Translations ADD object_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE VSCMS_PageCategories DROP FOREIGN KEY FK_98A43648C4663E4');
        $this->addSql('ALTER TABLE VSCMS_PageCategories DROP FOREIGN KEY FK_98A43648DE13F470');
        $this->addSql('ALTER TABLE VSCMS_PageCategories CHANGE page_id page_id INT NOT NULL, CHANGE taxon_id taxon_id INT NOT NULL');
        $this->addSql('ALTER TABLE VSCMS_PageCategories RENAME INDEX idx_98a43648c4663e4 TO page_id');
        $this->addSql('ALTER TABLE VSCMS_PageCategories RENAME INDEX idx_98a43648de13f470 TO taxon_id');
        $this->addSql('ALTER TABLE VSCMS_Pages DROP FOREIGN KEY FK_345A075A12469DE2');
        $this->addSql('DROP INDEX UNIQ_345A075A989D9B62 ON VSCMS_Pages');
        $this->addSql('DROP INDEX IDX_345A075A12469DE2 ON VSCMS_Pages');
        $this->addSql('ALTER TABLE VSCMS_Pages CHANGE category_id category_id INT NOT NULL, CHANGE published published TINYINT(1) DEFAULT \'0\' NOT NULL, CHANGE slug slug VARCHAR(128) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE title title VARCHAR(128) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('DROP INDEX UNIQ_CAFDCD035D8BC1F8 ON VSUM_Users');
        $this->addSql('ALTER TABLE VSUM_Users ADD preferedLocale VARCHAR(6) CHARACTER SET latin1 DEFAULT \'en\' NOT NULL COLLATE `latin1_swedish_ci`, ADD username_canonical VARCHAR(180) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, ADD email_canonical VARCHAR(180) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, ADD subscriptionId INT DEFAULT NULL, ADD user_info_id INT DEFAULT NULL, CHANGE username username VARCHAR(180) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE email email VARCHAR(180) CHARACTER SET latin1 NOT NULL COLLATE `latin1_swedish_ci`, CHANGE salt salt VARCHAR(255) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, CHANGE prefered_locale prefered_locale VARCHAR(16) CHARACTER SET latin1 DEFAULT \'en\' NOT NULL COLLATE `latin1_swedish_ci`, CHANGE first_name first_name VARCHAR(64) CHARACTER SET latin1 DEFAULT \'NOT_EDITED_YET\' NOT NULL COLLATE `latin1_swedish_ci`, CHANGE last_name last_name VARCHAR(64) CHARACTER SET latin1 DEFAULT \'NO_EDITED_YET\' NOT NULL COLLATE `latin1_swedish_ci`, CHANGE last_login last_login DATETIME DEFAULT NULL, CHANGE confirmation_token confirmation_token VARCHAR(180) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('ALTER TABLE VSUM_UsersInfo ADD apiToken VARCHAR(255) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, ADD firstName VARCHAR(128) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, ADD lastName VARCHAR(128) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, DROP api_token, CHANGE country country VARCHAR(3) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, CHANGE birthday birthday DATETIME DEFAULT NULL, CHANGE mobile mobile VARCHAR(16) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, CHANGE website website VARCHAR(64) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`, CHANGE occupation occupation VARCHAR(64) CHARACTER SET latin1 DEFAULT NULL COLLATE `latin1_swedish_ci`');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_9E6E7D917BA2F5EB ON VSUM_UsersInfo (apiToken)');
    }
}
